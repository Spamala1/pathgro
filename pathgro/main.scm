;;
;; pathgro - combinatoric pathname wordlist expander
;;
;; v1.0 coded by Derek Callaway [derek.callaway (AT) ioactive {D0T} com]
;;

(define-module (pathgro main)
               #:export (main)
               #:use-module (ice-9 common-list)
               #:use-module (ice-9 getopt-long)
               #:use-module (srfi srfi-1))

(use-modules (pathgro base combine-paths) (pathgro base read-pathsfiles) (pathgro base path-combos))
(use-modules (pathgro util ansi-color) (pathgro util clean-list) (pathgro util stdio))
(use-modules (pathgro base path-kperms) (pathgro base path-slashes) (pathgro base path-strings))
(use-modules (pathgro base path-powerset) (pathgro base path-saves) (pathgro base path-traverse))
(use-modules (pathgro base path-generate) (pathgro base path-macos) (pathgro base path-vimswap))
(use-modules (pathgro util rand-values) (pathgro version) (pathgro help))

(define (main args) 
  (let* 
    ((option-spec 
      '((help       (single-char #\h))
	(0Grow      (single-char #\0))
        (1Grow      (single-char #\1))
        (2Grow      (single-char #\2))
        (3Grow      (single-char #\3))
        (4Grow      (single-char #\4))
        (5Grow      (single-char #\5))
        (6Grow      (single-char #\6))
        (7Grow      (single-char #\7))
        (8Grow      (single-char #\8))
        (basename   (single-char #\b))
        (dirname    (single-char #\d))
        (extname    (single-char #\e))
        (filename   (single-char #\f))
        (Powerset   (single-char #\P) (value #t))
        (Combos     (single-char #\C) (value #t))
        (Kperms     (single-char #\K) (value #t))
        (xtdirname  (single-char #\x))
        (noslash    (single-char #\n))
        (generate   (single-char #\g))
        (macos      (single-char #\m))
        (rmtrail    (single-char #\r))
        (saves      (single-char #\s))
        (Traverse   (single-char #\T) (value #t))
        (vimswap    (single-char #\v))
        (Version    (single-char #\V))))
     (options          (getopt-long args option-spec #:stop-at-first-non-option #t))
     (opt-help         (option-ref options 'help #f))
     (opt-0Grow        (option-ref options '0Grow #f))
     (opt-1Grow        (option-ref options '1Grow #f))
     (opt-2Grow        (option-ref options '2Grow #f))
     (opt-3Grow        (option-ref options '3Grow #f))
     (opt-4Grow        (option-ref options '4Grow #f))
     (opt-5Grow        (option-ref options '5Grow #f))
     (opt-6Grow        (option-ref options '6Grow #f))
     (opt-7Grow        (option-ref options '7Grow #f))
     (opt-8Grow        (option-ref options '8Grow #f))
     (opt-Version      (option-ref options 'Version #f))
     (opt-basename     (option-ref options 'basename #f))
     (opt-dirname      (option-ref options 'dirname #f))
     (opt-extname      (option-ref options 'extname #f))
     (opt-filename     (option-ref options 'filename #f))
     (opt-generate     (option-ref options 'generate #f))
     (opt-macos        (option-ref options 'macos #f))
     (opt-saves        (option-ref options 'saves #f))
     (opt-vimswap      (option-ref options 'vimswap #f))
     (opt-Powerset     (string->number (option-ref options 'Powerset "0")))
     (opt-Combos       (string->number (option-ref options 'Combos "0")))
     (opt-Kperms       (string->number (option-ref options 'Kperms "0")))
     (opt-Traverse     (string->number (option-ref options 'Traverse "0")))
     (opt-xtdirname    (option-ref options 'xtdirname #f))
     (opt-noslash      (option-ref options 'noslash #f))
     (opt-rmtrail      (option-ref options 'rmtrail #f)))
    (cond
      (opt-help
        (display-help))
      (opt-Version
        (display-version))
      (else
	(when opt-0Grow (begin (srand) (set! opt-basename (rand-truth-value)) (srand) (set! opt-extname (rand-truth-value)) (srand) (set! opt-filename (rand-truth-value)) (srand) (set! opt-dirname (rand-truth-value)) (srand) (set! opt-xtdirname (rand-truth-value)) (srand) (set! opt-macos (rand-truth-value)) (srand) (set! opt-saves (rand-truth-value)) (srand) (set! opt-generate (rand-truth-value)) (srand) (set! opt-vimswap (rand-truth-value))))
        (when opt-1Grow (begin (set! opt-basename #t) (set! opt-extname #t) (set! opt-filename #t)))
        (when opt-2Grow (begin (set! opt-dirname #t) (set! opt-xtdirname #t)))
        (when opt-3Grow (begin (set! opt-basename #t) (set! opt-extname #t) (set! opt-filename #t) (set! opt-dirname #t) (set! opt-xtdirname #t)))
        (when opt-4Grow (begin (set! opt-macos #t) (set! opt-saves #t)))
        (when opt-5Grow (begin (set! opt-generate #t) (set! opt-vimswap #t)))
        (when opt-6Grow (begin (set! opt-macos #t) (set! opt-saves #t) (set! opt-generate #t) (set! opt-vimswap #t)))
        (when opt-7Grow (begin (set! opt-Combos 1) (set! opt-Powerset 1) (set! opt-Kperms 1) (set! opt-Traverse 1)))
        (when opt-8Grow (begin (set! opt-basename #t) (set! opt-extname #t) (set! opt-filename #t) (set! opt-dirname #t)
          (set! opt-xtdirname #t) (set! opt-macos #t) (set! opt-saves #t) (set! opt-generate #t) (set! opt-vimswap #t)
          (set! opt-Combos 1) (set! opt-Powerset 1) (set! opt-Kperms 1) (set! opt-Traverse 1)))
        (let ((stripped-args (option-ref options '() '()))
              (pathgro-debug (getenv "PATHGRO_DEBUG")))
          (when (zero? (length stripped-args)) (display-help))
          (read-pathsfiles stripped-args)
          (let ((cfiles (prepend-slashes (clean (combine-files-helper bases extns))))
                (edirs (prepend-slashes (clean (combine-files-helper dirns extns)))))
                  (when opt-noslash (set! prepend-slashes unprepend-slashes))
                  (if opt-rmtrail 
		    (begin 
                      (set! dirns (unappend-slashes dirns))
		      (set! edirs (unappend-slashes edirs)))
		    (set! unappend-slashes append-slashes))
                  (when (and opt-filename (zero? opt-Powerset)) (output-list (prepend-slashes cfiles)))
                  (when opt-basename   (output-list (prepend-slashes bases)))
    (when opt-generate   (output-list (prepend-slashes (flatten (map (lambda (b) (path-generate b)) bases)))))
    (when opt-macos      (output-list (prepend-slashes (flatten (map (lambda (b) (path-macos b)) bases)))))
    (when opt-saves      (output-list (prepend-slashes (flatten (map (lambda (b) (path-saves b)) bases)))))
    (when opt-vimswap    (output-list (prepend-slashes (flatten (map (lambda (b) (path-vimswap b)) bases)))))
    (when (and opt-dirname (zero? opt-Powerset)) (output-list (prepend-slashes dirns)))
    (when opt-extname    (output-list (prepend-slashes extns)))
    (when opt-xtdirname (output-list (prepend-slashes edirs)))
    (when (not (zero? opt-Traverse))
        (output-list (path-traverse opt-Traverse "../" (prepend-slashes (flatten dirns)))))
    (when (< 0 opt-Combos) 
      (let ((cps (path-combos opt-Combos cfiles dirns)))
        (output-list (prepend-slashes (flatten cps)))))
    (when (< 0 opt-Kperms)
      (let ((pkp (path-kperms opt-Kperms cfiles dirns)))
        (output-list (prepend-slashes (flatten pkp)))))
    (when (< 0 opt-Powerset)
      (let ((aps (path-powerset 1 opt-Powerset cfiles dirns)))
        (output-list (prepend-slashes (flatten aps))))))))))
        (exit 0))
