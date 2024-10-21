(define memories
  '(
    (memory LoMem
        (address (#xa000 . #xcfff))
        (type ANY))
    (memory Vector (address (#xffe4 . #xffff)))
    (memory Banks
      (address (#x10000 . #x1ffff))
      (type ANY)
      (section (header #x10000)))
    (memory Foo
      (address (#x20000 . #x2ffff))
      (section zfar))
    (memory HeapBank
      (address (#x30000 . #x3ffff))
      (section heap))
    (memory DirectPage
      (address (#x000100 . #x0001ff))
          (section (registers ztiny)))

    (block stack (size #x1000))
    (block heap (size #x10000))
    (base-address _DirectPageStart DirectPage 0)
    (base-address _NearBaseAddress LoMem 0)
))
