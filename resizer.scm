(define (bp-resize pattern pre w h)
    (let* (
            (files (cadr (file-glob pattern 1)))
            (total (length files))
          )
        (if (= (string-length pre) 0)
          (set! pre (number->string total))
          (set! pre (string-append pre (number->string total)))
        )
        (while (not (null? files))
            (let* (
                    (fname (car files))
                    (targetf (string-append pre fname))
                    (image (car (gimp-file-load RUN-NONINTERACTIVE fname fname)))
                    (drawable (car (gimp-image-get-active-layer image)))
                  )
                (gimp-image-scale-full image w h INTERPOLATION-CUBIC)
                (gimp-file-save RUN-NONINTERACTIVE image drawable targetf targetf)
                (gimp-image-delete image))
            (set! files (cdr files))
        )
    )
)
