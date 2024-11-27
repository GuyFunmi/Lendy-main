;; Define constants
(define-constant ERR_NO_LOAN (err u200))

;; Define data maps
(define-map user-loans principal { principal: uint, interest-accrued: uint, last-updated: uint })

;; Define constants for interest calculation
(define-constant APR u10) ;; 10% annual interest rate
(define-constant SECONDS_IN_YEAR u31536000)

;; Internal helper: Calculate accrued interest
(define-private (calculate-interest (principal uint) (last-updated uint))
  (let (
    (time-elapsed (- block-height last-updated))
    (rate (/ APR u100))
    (interest (/ (* (* principal rate) time-elapsed) u144)) ;; 144 blocks per day, assuming 10-minute block times
  )
    interest
  )
)

;; Issue a loan
(define-public (issue-loan (amount uint))
  (let (
    (existing-loan (map-get? user-loans tx-sender))
  )
    (asserts! (is-none existing-loan) (err u201)) ;; Loan already exists
    (ok (map-set user-loans tx-sender { principal: amount, interest-accrued: u0, last-updated: block-height }))
  )
)

;; Accrue interest on a loan
(define-public (accrue-interest)
  (let (
    (loan (unwrap! (map-get? user-loans tx-sender) ERR_NO_LOAN))
    (principal (get principal loan))
    (last-updated (get last-updated loan))
    (interest (calculate-interest principal last-updated))
  )
    (ok (map-set user-loans tx-sender {
      principal: principal,
      interest-accrued: (+ (get interest-accrued loan) interest),
      last-updated: block-height
    }))
  )
)

;; Get total loan balance (principal + interest)
(define-read-only (get-total-loan-balance (user principal))
  (let (
    (loan (unwrap! (map-get? user-loans user) ERR_NO_LOAN))
    (principal (get principal loan))
    (last-updated (get last-updated loan))
    (additional-interest (calculate-interest principal last-updated))
  )
    (ok (+ principal (get interest-accrued loan) additional-interest))
  )
)