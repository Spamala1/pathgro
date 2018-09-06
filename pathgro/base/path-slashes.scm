(define-module (pathgro base path-slashes)
               #:use-module (srfi srfi-43)
               #:export (append-slashes prepend-slashes unappend-slashes unprepend-slashes))

(define (prepend-slashes slst)
  (if (null? slst)
    '()
    (if (string=? (substring/shared (car slst) 0 1) "/")
      (cons (car slst) (prepend-slashes (cdr slst)))
      (cons (string-append/shared "/" (car slst)) (prepend-slashes (cdr slst))))))

(define (prepend-slashes->vector svec)
  (let ((acar (vector-car svec)))
    (vector-map! (lambda (i s)
                   (if (string=? (substring/shared svec 0 1) "/")
                     (cons svec (prepend-slashes->vector (vector-cdr avec)))
                     (vector-append (vector-car svec) (vector-cdr avec)))) svec)))

(define (unprepend-slashes slst)
  (if (null? slst)
    '()
    (if (string=? (substring/shared (car slst) 0 1) "/")
      (cons (substring/shared (car slst) 1 (string-length (car slst))) (unprepend-slashes (cdr slst)))
      (cons (car slst) (unprepend-slashes (cdr slst))))))

(define (append-slashes slst)
  (if (null? slst)
    '()
    (if (string=? (substring/shared (car slst) 0 1) "/")
      (cons (car slst) (append-slashes (cdr slst)))
      (cons (string-append/shared "/" (car slst)) (append-slashes (cdr slst))))))

(define (unappend-slashes slst)
  (if (null? slst)
    '()
    (if (string=? (substring/shared (car slst) (- (string-length (car slst)) 1) (string-length (car slst))) "/")
      (cons (substring/shared 0 (- (string-length (car slst) 1)) (unappend-slashes (cdr slst))))
      (cons (car slst) (unappend-slashes (cdr slst))))))