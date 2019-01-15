(define-module (pathgro base path-slashes)
               #:export (append-slashes prepend-slashes unappend-slashes unprepend-slashes))

(use-modules (pathgro util stdio))

(define (prepend-slashes slst)
  (if (null? slst)
    '()
    (if (string=? (substring (car slst) 0 1) "/")
      (cons (car slst) (prepend-slashes (cdr slst)))
      (cons (string-append "/" (car slst)) (prepend-slashes (cdr slst))))))

(define (unprepend-slashes slst)
  (if (null? slst)
    '()
    (if (string=? (substring (car slst) 0 1) "/") 
      (cons (substring (car slst) 1 (string-length (car slst))) (unprepend-slashes (cdr slst)))
      (cons (car slst) (unprepend-slashes (cdr slst))))))

(define (append-slashes slst)
  (if (null? slst)
    '()
    (if (string=? (substring (car slst) 0 1) "/")
      (cons (car slst) (append-slashes (cdr slst)))
      (cons (string-append "/" (car slst)) (append-slashes (cdr slst))))))

(define (unappend-slashes slst)
  (if (null? slst)
    '()
    (if (string=? (substring (car slst) (- (string-length (car slst)) 1) (string-length (car slst))) "/")
      (cons (substring 0 (- (string-length (car slst)) 1)) (unappend-slashes (cdr slst)))
      (cons (string-trim-right (car slst)) (unappend-slashes (cdr slst))))))
