(define-module (pathgro base read-pathsfiles)
               #:use-module (ice-9 common-list)
               #:export (bases dirns extns read-pathsfiles handle-pathstr))

(use-modules (pathgro base path-strings))
(use-modules (pathgro util read-lines))
(use-modules (pathgro util clean-list))

(define-values (bases dirns extns) (values '() '() '()))

(define (string-haschar? astr achr)
  (not (eq? #f (string-index astr achr))))

(define (pathstr-hasdir? aname)
    (string-haschar? aname #\/))

(define (pathstr-hasext? aname)
    (string-haschar? aname #\.))

(define (pathstr-isdir? aname)
  (letrec ((asize (string-length aname))
           (szdec (- asize 1)))
    (= 1 (string-suffix-length aname "/" szdec asize))))

(define (extname afile)
    (cadr (string-split afile #\.)))

(define (handle-pathstr patho)
  (if (null? patho)
    '() 
    (let ((copad (cons patho dirns)))
      (if (pathstr-hasdir? patho)
        (if (pathstr-isdir? patho)
            (set! dirns (suniq (unblank copad)))
            (begin
              (set! dirns (suniq (unblank (cons (dirname patho) dirns))))
              (handle-pathstr (basename patho))))
          (if (pathstr-hasext? patho)
            (let ((anext (extname patho)))
                (set! extns (suniq (unblank (cons anext extns))))
                (set! bases (suniq (unblank (cons (basename patho (string-append/shared "." anext)) bases)))))
            (set! dirns (suniq (unblank copad))))))))

(define (apply-all alist)
  (if (null? alist)
    '()
    (cons (map handle-pathstr (car alist)) (apply-all (cdr alist)))))

(define (read-pathsfiles files-list)
  (if (null? files-list)
    '()
    (if (not (file-exists? (car files-list)))
      (read-pathsfiles (cdr files-list))
      (cons (apply-all (delete! "" (paths2words (read-lines (car files-list))))) (read-pathsfiles (cdr files-list))))))
