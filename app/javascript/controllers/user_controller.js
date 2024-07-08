import { Controller } from "@hotwired/stimulus"
import axios from 'axios'

export default class extends Controller {
    static targets = [ "followButton", "followButtonBig", "followCount" ]

    // 文字型追蹤按鈕
    follow(event) {
        event.preventDefault();

        let user = event.currentTarget.dataset.user
        // data: { action: "user#follow", user: @post.user.id }
        // <a data-action="user#follow" data-user="1" href="#">
        // 這樣就可以 抓到 data-user屬性 的 值 使用者（文章作者）id，抓到就可以拿來塞在要打的api路徑中，才知道是要追蹤哪個使用者

        let target = this.followButtonTarget
        // 要被變動顯示內容 的html元素

        axios.post(`/api/v1/users/${user}/follow`)
        // follow_api_v1_user    POST   /api/v1/users/:id/follow(.:format)       api/v1/users#follow
            .then(function(response){
                
                let status = response.data.status 
                
                // 後端controller（users#follow）傳過來的資料
                // render json: {status: '已取消追蹤'} 或 render json: {status: '已追蹤'}
                switch (status) {
                    case '使用者未登入':
                    // 後端controller： render json: {status: '使用者未登入'} 
                        alert('先登入才能追蹤該用戶喔');
                        break;
                    case '已取消追蹤':
                        target.innerHTML = '追蹤'; // innerHTML對html元素內容的置換可以及時顯示，不用重新整理頁面
                        // alert('已取消追蹤');
                        target.classList.add('text-sky-500', 'hover:text-sky-400');
                        target.classList.remove('text-gray-500', 'hover:text-gray-400');
                        break;
                    case '已追蹤':
                        target.innerHTML = '追蹤中';
                        target.classList.add('text-gray-500', 'hover:text-gray-400');
                        target.classList.remove('text-sky-500', 'hover:text-sky-400');
                        break;
                }
            })
            .catch(function(error){
                console.log(error)
            })

    }

    // 按鈕型追蹤按鈕
    followBig(event) {
        event.preventDefault();

        let user = event.currentTarget.dataset.user
        // data: { action: "user#followBig", user: @post.user.id }

        let button = this.followButtonBigTarget
        // 要被變動顯示內容 的html元素

        axios.post(`/api/v1/users/${user}/follow`)
        // follow_api_v1_user    POST   /api/v1/users/:id/follow(.:format)       api/v1/users#follow
            .then(function(response){
                
                let status = response.data.status 
                
                // 後端controller（users#follow）傳過來的資料
                // render json: {status: '已取消追蹤'} 或 render json: {status: '已追蹤'}
                switch (status) {
                    case '使用者未登入':
                    // 後端controller： render json: {status: '使用者未登入'} 
                        alert('先登入才能追蹤該用戶喔');
                        break;
                    case '已取消追蹤':
                        button.innerHTML = '追蹤'; // innerHTML對html元素內容的置換可以及時顯示，不用重新整理頁面
                        // alert('已取消追蹤');
                        button.classList.add('bgc-light-blue', 'hover:bg-sky-400', 'text-white');
                        button.classList.remove('bg-gray-300', 'hover:bg-white');
                        break;
                    case '已追蹤':
                        button.innerHTML = '追蹤中';
                        button.classList.add('bg-gray-300', 'hover:bg-white');
                        button.classList.remove('bgc-light-blue', 'hover:bg-sky-400', 'text-white');
                        break;
                }
            })
            .catch(function(error){
                console.log(error)
            })
    }

    // 帶有粉絲數量的追蹤按鈕（但1個action不能有2個target？）
    followBigCount(event) {
        event.preventDefault();

        let user = event.currentTarget.dataset.user
        // data: { action: "user#followBig", user: @post.user.id }

        let button = this.followButtonBigTarget
        let countTarget = this.followCountTarget
        // 要被變動顯示內容 的html元素

        axios.post(`/api/v1/users/${user}/follow`)
        // follow_api_v1_user    POST   /api/v1/users/:id/follow(.:format)       api/v1/users#follow
            .then(function(response){
                
                // 後端controller（users#follow）傳過來的資料
                let status = response.data.status // render json: {status: '已取消追蹤'} 或 render json: {status: '已追蹤'}
                let followedCount = response.data.count
                console.log(followedCount)
               
                switch (status) {
                    case '使用者未登入':
                    // 後端controller： render json: {status: '使用者未登入'} 
                        alert('先登入才能追蹤該用戶喔');
                        break;
                    case '已取消追蹤':
                        button.innerHTML = '追蹤'; // innerHTML對html元素內容的置換可以及時顯示，不用重新整理頁面
                        alert('已取消追蹤');
                        button.classList.add('bgc-light-blue', 'hover:bg-sky-400', 'text-white');
                        button.classList.remove('bg-gray-300', 'hover:bg-white');
                        countTarget.innerHTML = followedCount;
                        break;
                    case '已追蹤':
                        button.innerHTML = '追蹤中';
                        button.classList.add('bg-gray-300', 'hover:bg-white');
                        button.classList.remove('bgc-light-blue', 'hover:bg-sky-400', 'text-white');
                        countTarget.innerHTML = followedCount;
                        break;
                }
            })
            .catch(function(error){
                console.log(error)
            })
    }
}
