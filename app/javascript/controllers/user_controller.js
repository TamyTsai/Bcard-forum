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

        axios.post(`/users/${user}/follow`)
        // follow_user    POST   /users/:id/follow(.:format)          users#follow
            .then(function(response){
                console.log(response)
                // let status = response.data.status 
                // // 後端controller（users#follow）傳過來的資料
                // // render json: {status: '追蹤中'} 或 render json: {status: '追蹤'}
                // switch (status) {
                //     case '追蹤中':
                //         target.innerHTML = status;
                //         break;
                //     default:
                //         target.innerHTML = status;
                //         alert('已取消追蹤');
                //         break;
                // }
            })
            .catch(function(error){
                console.log(error)
            })

    }
}
