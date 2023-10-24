window.addEventListener('load', function () {
  // open modal 
  // const openModal = document.querySelector(".cmt-message-sticker");
  // const modal = document.querySelector(".sticker-modal");
  // openModal.addEventListener('click', function () {
  //   if (modal.classList.contains('active')) {
  //     modal.classList.remove('active');
  //   } else {
  //     modal.classList.add('active');
  //   }
  // })
  // swap tab 
  let tabLinks = document.querySelectorAll(".modal-tab-item");
  let tabContent = document.querySelectorAll(".sticker-modal-content");
  let tabIndicator = document.querySelector(".tab-indicator");
  tabLinks.forEach(function (el) {
    el.addEventListener("click", openTabs);
  });


  function openTabs(el) {
    var btn = el.currentTarget;
    var content = btn.dataset.content;
    let widthTab = el.currentTarget.offsetWidth
    tabContent.forEach(function (el) {
      el.classList.remove("active");
    });

    tabLinks.forEach(function (el) {
      el.classList.remove("active");
    });
    document.querySelector("#" + content).classList.add("active");
    btn.classList.add("active");

    if (content == 'stickerContent') {
      tabIndicator.style.width = widthTab;
      tabIndicator.style.left = 16;
    } else if (content == 'emojiContent') {
      tabIndicator.style.width = widthTab;
      tabIndicator.style.left = 16 + widthTab;
    } else {
      tabIndicator.style.width = widthTab;
      tabIndicator.style.left = 16 + 95 + widthTab;
    }
  }


  // slide
  const tabsBox = document.querySelector('#stickerContent .modal-slide-list'),
    allTabs = tabsBox.querySelectorAll('.modal-slide-item'),
    arrowIcons = document.querySelectorAll('#stickerContent .slide-nav'),
    // tabsBoxEmoji = document.querySelector('#emojiContent .modal-slide-list'),
    arrowIconsEmoji = document.querySelectorAll('#emojiContent .slide-nav');

  let isDragging = false;

  const handleIcons = scrollVal => {
    let maxScrollableWidth;
    if (document.querySelector('#stickerContent').classList.contains('active')) {
      maxScrollableWidth = tabsBox.scrollWidth - tabsBox.clientWidth;
      // arrowIcons[0].style.display = scrollVal <= 0 ? 'none' : 'flex';
      // arrowIcons[1].style.display =
      //   maxScrollableWidth - scrollVal <= 1 ? 'none' : 'flex';
    } else {
      // maxScrollableWidth = tabsBoxEmoji.scrollWidth - tabsBoxEmoji.clientWidth;
      arrowIconsEmoji[0].style.display = scrollVal <= 0 ? 'none' : 'flex';
      // arrowIconsEmoji[1].style.display =
      //   maxScrollableWidth - scrollVal <= 1 ? 'none' : 'flex';
    }
  }

  arrowIcons.forEach(icon => {
    icon.addEventListener('click', () => {
      let scrollWidth = (tabsBox.scrollLeft += icon.id === 'left' ? -44 : 44);
      handleIcons(scrollWidth);
    })
  });

  arrowIconsEmoji.forEach(icon => {
    icon.addEventListener('click', () => {
      // let scrollWidth = (tabsBoxEmoji.scrollLeft += icon.id === 'left' ? -44 : 44);
      // handleIcons(scrollWidth);
    })
  });

  allTabs.forEach(tab => {
    tab.addEventListener('click', () => {
      tabsBox.querySelector('.active').classList.remove('active');
      tab.classList.add('active');
      let idSticker = tab.dataset.sticker;
      document.querySelectorAll('#stickerContent .modal-icon-detai').forEach(function (el) {
        el.classList.remove('active')
      });
      document.querySelector("#stickerContent #" + idSticker).classList.add("active");
    })
  });

  const dragging = e => {
    if (!isDragging) return
    if (document.querySelector('#stickerContent').classList.contains('active')) {
      tabsBox.classList.add('dragging');
      tabsBox.scrollLeft -= e.movementX;
      handleIcons(tabsBox.scrollLeft);
    } else {
      // tabsBoxEmoji.classList.add('dragging');
      // tabsBoxEmoji.scrollLeft -= e.movementX;
      // handleIcons(tabsBoxEmoji.scrollLeft);
    }
  }

  const dragStop = () => {
    isDragging = false;
    tabsBox.classList.remove('dragging');
    // tabsBoxEmoji.classList.remove('dragging');
  }

  tabsBox.addEventListener('mousedown', () => (isDragging = true))
  tabsBox.addEventListener('mousemove', dragging)
  // tabsBoxEmoji.addEventListener('mousedown', () => (isDragging = true))
  // tabsBoxEmoji.addEventListener('mousemove', dragging)
  document.addEventListener('mouseup', dragStop)


  // slide emoji 

})
