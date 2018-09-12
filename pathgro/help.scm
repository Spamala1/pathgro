;;
;; display command line usage in full technicolor
;;

(define-module (pathgro help)
               #:export (display-help))

(use-modules (pathgro util ansi-color) (pathgro util stdio))

(define (display-help)
  (newline)
  (display (colorize-string "usage" 'YELLOW 'ON-BLUE 'BOLD 'UNDERLINE))
  (display (colorize-string ": " 'BOLD))
  (display (colorize-string "pathgro" 'WHITE 'ON-GREEN 'BOLD))
  (display " ")
  (display (colorize-string "[<OPTIONS>]" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  (display " ")
  (display (colorize-string "[<FILES>]" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  (newlines 2)
  (display "  ")
  (display (colorize-string "<OPTIONS>" 'BLACK 'ON-GREEN 'UNDERLINE))
  (display "              ")
  (display (colorize-string "one or more of the command line flags below" 'YELLOW))
  (newlines 2)
  (display "  ")
  (display (colorize-string "-v, --version" 'BLACK 'ON-YELLOW 'BOLD 'UNDERLINE))
  (display "          ")
  (display (colorize-string "displays the current software version banner string" 'CYAN))
  (newline)
  (display "  ")
  (display (colorize-string "-h, --help" 'BLACK 'ON-YELLOW  'BOLD 'UNDERLINE))
  (display "             ")
  (display (colorize-string "prints the usage information you're reading now" 'CYAN))
  (newline)
  (display "  ")
  (display (colorize-string "-b, --basename" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  (display "         ")
  (display (colorize-string "show base file names" 'MAGENTA))
  (newline)
  (display "  ")
  (display (colorize-string "-d, --dirname" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  (display "          ")
  (display (colorize-string "display directory names" 'MAGENTA))
  (newline)
  (display "  ")
  (display (colorize-string "-e, --extname" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  (display "          ")
  (display (colorize-string "output file extensions" 'MAGENTA))
  (newline)
  (display "  ")
  (display (colorize-string "-f, --filename" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  (display "         ")
  (display (colorize-string "print full filenames as base with extension" 'MAGENTA))
  (display " ")
  (display (colorize-string "[" 'WHITE 'ON-BLACK 'BOLD))
  (display (colorize-string "basename" 'BLACK 'ON-CYAN 'UNDERLINE))
  (display (colorize-string "." 'BLACK 'ON-CYAN 'BOLD 'UNDERLINE))
  (display (colorize-string "extname" 'BLACK 'ON-CYAN 'UNDERLINE))
  (display (colorize-string "]" 'WHITE 'ON-BLACK 'BOLD))
  (newline)
  (display "  ")
  (display (colorize-string "-x, --extdirname" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  (display "       ")
  (display (colorize-string "append file extensions to directory names" 'MAGENTA))
  (display "   ")
  (display (colorize-string "[" 'WHITE 'ON-BLACK 'BOLD))
  (display (colorize-string "dirname" 'BLACK 'ON-CYAN 'UNDERLINE))
  (display (colorize-string "." 'BLACK 'ON-CYAN 'BOLD 'UNDERLINE))
  (display (colorize-string "extname" 'BLACK 'ON-CYAN 'UNDERLINE))
  (display (colorize-string "]" 'WHITE 'ON-BLACK 'BOLD))
  (newline)
  (display "  ")
  (display (colorize-string "-n, --noslash" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  (display "          ")
  (display (colorize-string "remove forward slash from the start of each path name" 'MAGENTA))
  (newline)
  (display "  ")
  (display (colorize-string "-c, --combos" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  (display "   ")
  (display (colorize-string "CDEPTH" 'BLACK 'ON-YELLOW 'REVERSE 'UNDERLINE))
  (display "  ")
  (display (colorize-string "calculate path names at provided directory depth only" 'MAGENTA))
  (display "      ")
  (display (colorize-string "{" 'WHITE 'ON-BLACK 'BOLD))
  (display (colorize-string "n" 'BLACK 'ON-RED 'UNDERLINE))
  (display (colorize-string "-" 'BLACK 'ON-RED 'BOLD 'UNDERLINE))
  (display (colorize-string "choose" 'BLACK 'ON-RED 'UNDERLINE))
  (display (colorize-string "-" 'BLACK 'ON-RED 'BOLD 'UNDERLINE))
  (display (colorize-string "r" 'BLACK 'ON-RED 'UNDERLINE))
  (display (colorize-string "}" 'WHITE 'ON-BLACK 'BOLD))
  (newline)
  (display "  ")
  (display (colorize-string "-p, --powerset" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  (display " ")
  (display (colorize-string "PDEPTH" 'BLACK 'ON-YELLOW 'REVERSE 'UNDERLINE))
  (display "  ")
  (display (colorize-string "compute paths for directory combinations up to given level" 'MAGENTA))
  (display " ")
  (display (colorize-string "{" 'WHITE 'ON-BLACK 'BOLD))
  (display (colorize-string "power" 'BLACK 'ON-RED 'UNDERLINE))
  (display (colorize-string "-" 'BLACK 'ON-RED 'BOLD 'UNDERLINE))
  (display (colorize-string "set" 'BLACK 'ON-RED 'UNDERLINE))
  (display (colorize-string "}" 'WHITE 'ON-BLACK 'BOLD))
  (newline)
  (display "  ")
  (display (colorize-string "-k, --kperms" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  (display "   ")
  (display (colorize-string "KDEPTH" 'BLACK 'ON-YELLOW 'REVERSE 'UNDERLINE))
  (display "  ")
  (display (colorize-string "enumerate all directory orderings of specified depth" 'MAGENTA))
  (display "       ")
  (display (colorize-string "{" 'WHITE 'ON-BLACK 'BOLD))
  (display (colorize-string "k" 'BLACK 'ON-RED 'UNDERLINE))
  (display (colorize-string "-" 'BLACK 'ON-RED 'BOLD 'UNDERLINE))
  (display (colorize-string "permutations" 'BLACK 'ON-RED 'UNDERLINE))
  (display (colorize-string "}" 'WIHTE 'ON-BLACK 'BOLD))
  ;(newline)
  ;(display "  ")
  ;(display (colorize-string "-i, --infix" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  ;(display "  ")
  ;(display (colorize-string "STRING" 'BLACK 'ON-BLUE 'REVERSE 'UNDERLINE))
  ;(display "  ")
  ;(display (colorize-string "infix a string after the last directory slash and before the filename" 'GREEN))
  ;(newline)
  ;(display "  ")
  ;(display (colorize-string "-p, --prefix" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  ;(display " ")
  ;(display (colorize-string "STRING" 'BLACK 'ON-BLUE 'REVERSE 'UNDERLINE))
  ;(display "  ")
  ;(display (colorize-string "prefix each path name with the provided string" 'GREEN))
  ;(newline)
  ;(display "  ")
  ;(display (colorize-string "-s, --suffix" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  ;(display " ")
  ;(display (colorize-string "STRING" 'BLACK 'ON-BLUE 'REVERSE 'UNDERLINE))
  ;(display "  ")
  ;(display (colorize-string "suffix each path name with the provided string" 'GREEN))
  ;(newline)
  ;(display "  ")
  ;(display (colorize-string "-t, --trail" 'BLACK 'ON-GREEN 'BOLD 'UNDERLINE))
  ;(display "     ")
  ;(display (colorize-string "append a trailing forward slash character to the end of each path" 'GREEN))
  ;(newline)
  (newlines 2)
  (display "  ")
  (display (colorize-string "<FILES>" 'BLACK 'ON-GREEN 'UNDERLINE))
  (display "                ")
  (display (colorize-string "locations of wordlist files to process, parse and expand" 'YELLOW))
  (newline)
  ;(display "  ")
  ;(display (colorize-string "STRING" 'BLACK 'ON-YELLOW 'REVERSE 'UNDERLINE))
  ;(display "               ")
  ;(display (colorize-string "string to include with created path names by way of prefix, infix and/or suffix" 'BLUE))
  ;(newline)
  (display "  ")
  (display (colorize-string "CDEPTH" 'BLACK 'ON-YELLOW 'REVERSE 'UNDERLINE))
  (display "                 ")
  (display (colorize-string "maximum number of slashes to allow in computed paths" 'GREEN))
  (display "  ")
  (display (colorize-string "(" 'WHITE 'ON-BLACK 'BOLD))
  (display (colorize-string "small" 'BLACK 'ON-BLUE 'UNDERLINE))
  (display (colorize-string ")" 'WHITE 'ON-BLACK 'BOLD))
  (newline)
  (display "  ")
  (display (colorize-string "PDEPTH" 'BLACK 'ON-YELLOW 'REVERSE 'UNDERLINE))
  (display "                 ")
  (display (colorize-string "generate path subsets up to this level of directories" 'GREEN))
  (display " ")
  (display (colorize-string "(" 'WHITE 'ON-BLACK 'BOLD))
  (display (colorize-string "medium" 'BLACK 'ON-BLUE 'UNDERLINE))
  (display (colorize-string ")" 'WHITE 'ON-BLACK 'BOLD))
  (newline)
  (display "  ")
  (display (colorize-string "KDEPTH" 'BLACK 'ON-YELLOW 'REVERSE 'UNDERLINE))
  (display "                 ")
  (display (colorize-string "how many directories deep to calculate path orderings" 'GREEN))
  (display " ")
  (display (colorize-string "(" 'WHITE 'ON-BLACK 'BOLD))
  (display (colorize-string "large" 'BLACK 'ON-BLUE 'UNDERLINE))
  (display (colorize-string ")" 'WHITE 'ON-BLACK 'BOLD))
  (newlines 2)
  (display "  ")
  (display (colorize-string "Note" 'BLUE))
  (display (colorize-string ":" 'WHITE 'BOLD))
  (display " ")
  (display (colorize-string "size notations signify output amount each mode generates" 'RED))
  (newlines 2)
  (exit 0))
