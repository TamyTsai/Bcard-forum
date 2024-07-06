import { Controller } from "@hotwired/stimulus"
import axios from 'axios'

export default class extends Controller {
    static targets = [ "followButton" ]


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
                    // 後端controller： render json: {status: '先登入才能追蹤該用戶喔'} 
                        alert('先登入才能追蹤該用戶喔');
                        break;
                    case '已取消追蹤':
                        target.innerHTML = '追蹤'; // innerHTML對html元素內容的置換可以及時顯示，不用重新整理頁面
                        // alert('已取消追蹤');
                        break;
                    case '已追蹤':
                        target.innerHTML = '追蹤中';
                        break;
                }
            })
            .catch(function(error){
                console.log(error)
            })

    }
}
