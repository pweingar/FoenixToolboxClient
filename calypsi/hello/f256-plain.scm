(define memories
  '((memory Vector (address (#xffe4 . #xffff)))

    (memory DirectPage (address (#x000000 . #x0000ff)) (section registers))

    (memory LoMem
      (address (#x005000 . #x00bfff))
      (type ANY))

    (memory HeaderMem
      (address (#x010000 . #x01001f))
      (section (header)))

    (memory HiMem
      (address (#x010020 . #x01ffff))
	  (type ANY))

    (block stack (size #x1000))
    (block heap (size #x1000))
    (base-address _DirectPageStart DirectPage 0)
    (base-address _NearBaseAddress LoMem 0)
  ))
