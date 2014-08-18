;; example snippet/test: make a transparent image
(define (mk-img name)
    (let* (
            (img (car (gimp-image-new 250 250 RGB))) ;; the image
            (layer (car (gimp-layer-new img 250 250 RGBA-IMAGE "bg" 1 NORMAL))) ;;create a layer
        )
        (gimp-image-add-layer img layer 0);;add layer to img
        (gimp-drawable-fill layer TRANSPARENT-FILL);;set layer to transparent fill
        (gimp-file-save RUN-NONINTERACTIVE img layer "tst.png" "tst.png")
    )
)
