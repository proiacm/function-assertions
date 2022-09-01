
;; assertions
;; Example contract to demonstrate how assertions can be used to limit who can call a `public-function`

(define-constant ALLOWED_USERS 
(list
'ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5
'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
'ST2NEB84ASENDXKYGJPQW86YXQCEFEX2ZQPG87ND
'ST2REHHS5J3CERCRBEPMGH7921Q6PYKAADT7JP2VB
'ST3AM1A56AK2C1XAFJ4115ZSV26EB49BVQ10MGCS0
)
)

(define-constant ERR_NOT_ALLOWED (err "Sorry, you can't call this function."))

(define-private (validate-user (user principal))
  (is-some (index-of ALLOWED_USERS user))
)

(define-public (restricted)
  (begin 
    (asserts! (validate-user tx-sender) ERR_NOT_ALLOWED)
    (ok "Welcome to the club.")
  )
)