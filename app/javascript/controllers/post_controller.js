import { Controller } from "@hotwired/stimulus"
import axios from 'axios'
// 會去找node_modules裡的東西

export default class extends Controller {
  static targets = [ "loveCount", "bookmark" ]

  addLove(event) {
    event.preventDefault();

    let slug = event.currentTarget.dataset.slug
    // <a data-action="post#addLove" data-slug="文章標題" href="#">
    // 這樣就可以 抓到 data-slug屬性 的 值"文章標題"，抓到就可以拿來塞在要打的api路徑中，才知道是要為哪篇文章按愛心
    // let slug = this.loveCountTarget.dataset.slug //不能這樣寫 這樣不能用dataset？ 因data action 跟 data target不同元素？
    // event.currentTarget -> 給出被點擊的元素（連結） - 「可以在其中存取資料集」，從而獲得被點擊元素的 data-id
    // Event 介面的唯讀屬性 currentTarget 會標明事件指向（current target）、還有該事件所遍歷的 DOM。屬性總會指向當時處理該事件的 事件監聽器 所註冊的 DOM 物件，而 event.target 屬性則是永遠指向觸發事件的 DOM 物件。

    let target = this.loveCountTarget
    // 要被變動顯示內容 的html元素

    axios.post(`/api/v1/posts/${slug}/love`) // ES6
    // love_api_v1_post   POST   /api/v1/posts/:id/love(.:format)    api/v1/posts#love
        .then(function(response){
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
        .catch(function(error){
            console.log(error)
        })
  }

  bookmark(event) {
    event.preventDefault();

    let slug = event.currentTarget.dataset.slug
    // <a data-action="post#bookmark" data-slug="文章照片" href="#">
    // 這樣就可以 抓到 data-slug屬性 的 值"文章標題"，抓到就可以拿來塞在要打的api路徑中，才知道是要收藏哪篇文章

    let target = this.bookmarkTarget
    // 要被變動顯示內容 的html元素

    axios.post(`/api/v1/posts/${slug}/bookmark`)
    // bookmark_api_v1_post    POST   /api/v1/posts/:id/bookmark(.:format)      api/v1/posts#bookmark
        .then(function(response){
            let status = response.data.status 
            // 後端controller（posts#bookmark）傳過來的資料
            // render json: {status: post.love} 或 render json: {status: '使用者未登入'}
            switch (status) {
                case '使用者未登入':
                    alert('先登入才能收藏文章喔');
                    break;
                default:
                    target.innerHTML = status;
                    // render json: {status: post.love} 
                    break;
            }
        })
        .catch(function(error){
            console.log(error)
        })
  }
}