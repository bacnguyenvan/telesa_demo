<div class="sticker-modal">
  <div class="flex flex-col border-2-b modal-contain ">
    <div class="flex flex-a-c w100 border-1-b modal-tab">
      <div class="flex flex-j-c flex-a-c flex-1 h100 modal-tab-item active" data-content="stickerContent">
        <span>STICKER</span>
      </div>
      <div class="flex flex-j-c flex-a-c flex-1 h100 modal-tab-item tab-emoji" data-content="emojiContent">
        <span>EMOJI</span>
      </div>
      <div class="flex flex-j-c flex-a-c flex-1 h100 modal-tab-item" data-content="gifContent">
        <span>GIF</span>
      </div>
      <div class="tab-indicator" style="width: 95px; left: 16px;"></div>
    </div>
    <div class="flex flex-1 w100">
      <div class="sticker-modal-content active w100" id="stickerContent">
        <!-- <div class="modal-search">
            <span class="flex flex-a-c group-search">
              <img src="./image/search.png" alt="">
              <input placeholder="Tìm kiếm sticker" class="input-search" value="">
            </span>
          </div> -->
        <div class="modal-icon">
          <div class="modal-icon-detai active" id="catSticker">
            <p class="modal-icon-name">Cat</p>
            <ul class="flex flex-wrap modal-icon-list">
              @for($i = 1; $i <= 11; $i++)
              <li class="modal-icon-item">
                <img src='{{asset("sticker/hinh_tinh/cat/sticker_$i.png")}}' alt="">
              </li>
              @endfor
            </ul>
          </div>
          <div class="modal-icon-detai" id="rabbitSticker">
            <p class="modal-icon-name">Rabbit</p>
            <ul class="flex flex-wrap modal-icon-list">
              @for($i = 1; $i <= 10; $i++)
              <li class="modal-icon-item">
                <img src='{{asset("sticker/hinh_tinh/rabbit/rabbit$i.webp")}}' alt="">
              </li>
              @endfor
            </ul>
          </div>
          <div class="modal-icon-detai" id="trocSticker">
            <p class="modal-icon-name">Trọc Trắng</p>
            <ul class="flex flex-wrap modal-icon-list">
              @for($i = 1; $i <= 11; $i++)
              <li class="modal-icon-item">
                <img src='{{asset("sticker/hinh_tinh/troc_trang/sticker_$i.webp")}}' alt="">
              </li>
              @endfor
            </ul>
          </div>
        </div>
        <div class="flex flex-a-c flex-j-sb modal-icon-type">
          <div class="flex flex-a-c h100 modal-slide">
            {{-- <a href="#" class="flex flex-j-c flex-a-c h100 slide-nav slide-prev" id="left">
              <span class="arrow arrow-left"></span>
            </a> --}}
            <ul class="flex flex-a-c h100 modal-slide-list">
              <li class="h100 modal-slide-item active" data-sticker="catSticker">
                <img src='{{asset("sticker/hinh_tinh/cat/sticker_1.png")}}' alt="">
              </li>
              <li class="h100 modal-slide-item" data-sticker="rabbitSticker">
                <img src='{{asset("sticker/hinh_tinh/rabbit/rabbit1.webp")}}' alt="">
              </li>
              <li class="h100 modal-slide-item" data-sticker="trocSticker">
                <img src='{{asset("sticker/hinh_tinh/troc_trang/sticker_1.webp")}}' alt="">
              </li>
            </ul>
            {{-- <a href="#" class="flex flex-j-c flex-a-c h100 slide-nav slide-next" id="right">
              <span class="arrow arrow-right"></span>
            </a> --}}
          </div>
          {{-- <div class="flex flex-a-c flex-j-c modal-slide-add">
            <div class="modal-add-icon"></div>
          </div> --}}
        </div>
      </div>
      <div class="sticker-modal-content w100" id="emojiContent">
        <div class="modal-icon">
          <div class="modal-icon-detai active" id="catSticker">
            <p class="modal-icon-name">Feeling</p>
            <ul class="flex flex-wrap modal-icon-list">
              @foreach($emojis as $item)
              <li class="modal-emoji-item">
                <span>{{$item}}</span>
              </li>
              @endforeach
            </ul>
          </div>
          <div class="modal-icon-detai" id="rabbitSticker">
            <p class="modal-icon-name">Rabbit</p>
            {{-- <ul class="flex flex-wrap modal-icon-list">
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/rabbit/rabbit1.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/rabbit/rabbit2.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/rabbit/rabbit3.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/rabbit/rabbit4.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/rabbit/rabbit5.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/rabbit/rabbit6.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/rabbit/rabbit7.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/rabbit/rabbit8.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/rabbit/rabbit9.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/rabbit/rabbit10.webp" alt="">
              </li>
            </ul> --}}
          </div>
          <div class="modal-icon-detai" id="trocSticker">
            <p class="modal-icon-name">Trọc Trắng</p>
            {{-- <ul class="flex flex-wrap modal-icon-list">
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/troc_trang/chpic.su_-_PeterCxy_001.png" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/troc_trang/PeterCxy_002.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/troc_trang/PeterCxy_003.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/troc_trang/PeterCxy_004.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/troc_trang/PeterCxy_006.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/troc_trang/PeterCxy_008.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/troc_trang/PeterCxy_010.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/troc_trang/PeterCxy_013.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/troc_trang/PeterCxy_016.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/troc_trang/PeterCxy_017.webp" alt="">
              </li>
              <li class="modal-icon-item">
                <img src="./Sticker/hinh_tinh/troc_trang/PeterCxy_020.webp" alt="">
              </li>
            </ul> --}}
          </div>
        </div>
        <div class="flex flex-a-c flex-j-sb modal-icon-type">
          <div class="flex flex-a-c h100 modal-slide">
            {{-- <a href="#" class="flex flex-j-c flex-a-c h100 slide-nav slide-prev" id="left">
              <span class="arrow arrow-left"></span>
            </a> --}}
            {{-- <ul class="flex flex-a-c h100 modal-slide-list">
              @for($i = 1; $i <= 11; $i++)
              <li class="h100 modal-slide-item active">
                <img src='{{asset("sticker/hinh_tinh/cat/sticker_$i.png")}}' alt="">
              </li>
              @endfor
            </ul> --}}
            {{-- <a href="#" class="flex flex-j-c flex-a-c h100 slide-nav slide-next" id="right">
              <span class="arrow arrow-right"></span>
            </a> --}}
          </div>
        </div>
      </div>
      <div class="sticker-modal-content w100" id="gifContent">
        <!-- <div class="modal-search">
            <span class="flex flex-a-c group-search">
              <img src="./image/search.png" alt="">
              <input placeholder="Tìm kiếm sticker" class="input-search" value="">
            </span>
          </div> -->
        <div class="gif-content">
          <p class="modal-icon-name">Ami</p>
          <div class="flex flex-row gif-4-col">
            @for($i = 1 ; $i <= 4; $i++)
            <div class="gif-img" src="{{asset('sticker/hinh_gif/AMI/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/AMI/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
          <div class="flex flex-row gif-3-col">
            @for($i = 5 ; $i <= 7; $i++)
            <div class="gif-img" src="{{asset('sticker/hinh_gif/AMI/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/AMI/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
          <div class="flex flex-row gif-2-col">
            @for($i = 8 ; $i <= 9; $i++)
            <div class="gif-img" src="{{asset('sticker/hinh_gif/AMI/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/AMI/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
          <p class="modal-icon-name">Angola rabbit</p>
          <div class="flex flex-row gif-4-col">
            @for($i = 1 ; $i <= 4; $i++)
            <div class="gif-img" src="{{asset('sticker/hinh_gif/ANGOLA_RABBIT/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/ANGOLA_RABBIT/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
          <div class="flex flex-row gif-3-col">
            @for($i = 5 ; $i <= 7; $i++)
            <div class="gif-img" src="{{asset('sticker/hinh_gif/ANGOLA_RABBIT/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/ANGOLA_RABBIT/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
          <div class="flex flex-row gif-3-col">
            @for($i = 8 ; $i <= 10; $i++)
            <div class="gif-img" src="{{asset('sticker/hinh_gif/ANGOLA_RABBIT/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/ANGOLA_RABBIT/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
          <p class="modal-icon-name">Dog</p>
          <div class="flex flex-row gif-4-col">
            @for($i = 1 ; $i <= 4; $i++)
            <div class="gif-img" src="{{asset('/sticker/hinh_gif/DOG/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/DOG/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
          <div class="flex flex-row gif-3-col">
            @for($i = 5 ; $i <= 7; $i++)
            <div class="gif-img" src="{{asset('/sticker/hinh_gif/DOG/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/DOG/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
          <div class="flex flex-row gif-3-col">
            @for($i = 8 ; $i <= 10; $i++)
            <div class="gif-img" src="{{asset('/sticker/hinh_gif/DOG/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/DOG/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
          <p class="modal-icon-name">Mobile girl</p>
          <div class="flex flex-row gif-4-col">
            @for($i = 1 ; $i <= 4; $i++)
            <div class="gif-img" src="{{asset('/sticker/hinh_gif/MOBILE_GIRL/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/MOBILE_GIRL/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
          <div class="flex flex-row gif-3-col">
            @for($i = 5 ; $i <= 7; $i++)
            <div class="gif-img" src="{{asset('/sticker/hinh_gif/MOBILE_GIRL/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/MOBILE_GIRL/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
          <div class="flex flex-row gif-2-col">
            @for($i = 8 ; $i <= 9; $i++)
            <div class="gif-img" src="{{asset('/sticker/hinh_gif/MOBILE_GIRL/sticker_' . $i . '.gif')}}" style="background-image: url({{asset('/sticker/hinh_gif/MOBILE_GIRL/sticker_' . $i . '.gif')}})"></div>
            @endfor
          </div>
        </div>
      </div>
    </div>
  </div>
</div>