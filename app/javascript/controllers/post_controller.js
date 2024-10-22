import { Controller } from "@hotwired/stimulus"
import axios from 'axios'
// 會去找node_modules裡的東西

export default class extends Controller {
  static targets = [ "loveCount", "bookmark", "bookmarkCount" ]

  addLove(event) {
    event.preventDefault();

    let slug = event.currentTarget.dataset.slug
    // <a data-action="post#addLove" data-slug="文章標題" href="#">
    // 這樣就可以 抓到 data-slug屬性 的 值"文章標題"，抓到就可以拿來塞在要打的api路徑中，才知道是要為哪篇文章按愛心

    let target = this.loveCountTarget
    // 要被變動顯示內容 的html元素

    axios.post(`/api/v1/posts/${slug}/love`) // ES6
    // love_api_v1_post   POST   /api/v1/posts/:id/love(.:format)    api/v1/posts#love
        .then((response) => {
            let status = response.data.status 
            // 後端controller（posts#love）傳過來的資料
            // render json: {status: post.love} 或 render json: {status: '使用者未登入'}
            switch (status) {
                case '使用者未登入':
                    alert('先登入才能按愛心喔');
                    break;
                default:
                    target.innerHTML = status;
                    // render json: {status: post.love} 
                    break;
            }
        })
        .catch((error) => {
            console.log(error)
        })
  }

  bookmark(event) {
    event.preventDefault();

    let slug = event.currentTarget.dataset.slug
    // <a data-action="post#bookmark" data-slug="文章照片" href="#">
    // 這樣就可以 抓到 data-slug屬性 的 值"文章標題"，抓到就可以拿來塞在要打的api路徑中，才知道是要收藏哪篇文章

    // 要被變動顯示內容 的html元素
    let icon = this.bookmarkTarget
    let count = this.bookmarkCountTarget

    axios.post(`/api/v1/posts/${slug}/bookmark`)
    // bookmark_api_v1_post    POST   /api/v1/posts/:id/bookmark(.:format)      api/v1/posts#bookmark
        .then((response) => {

            // 後端controller（posts#bookmark）傳過來的資料
            let status = response.data.status
            let counts = response.data.count

            switch (status) {
                case '使用者未登入':
                // 後端controller： render json: {status: '使用者未登入'} 
                    alert('先登入才能收藏該文章喔');
                    break;
                case '已被取消收藏':
                    icon.classList.add('text-gray-400', 'hover:text-sky-500'); // innerHTML對html元素內容的置換可以及時顯示，不用重新整理頁面
                    icon.classList.remove('text-sky-500');
                    count.innerHTML = counts;
                    // render json: {status: @post.bookmark!(current_user), count: @post.bookmarks.count}
                    break;
                case '已被收藏':
                    icon.classList.add('text-sky-500');
                    icon.classList.remove('text-gray-400', 'hover:text-sky-500'); // innerHTML對html元素內容的置換可以及時顯示，不用重新整理頁面
                    count.innerHTML = counts;
                    break;
            }
        })
        .catch((error) => {
            console.log(error)
        })
  }
}