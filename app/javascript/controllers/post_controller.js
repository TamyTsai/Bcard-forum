import { Controller } from "@hotwired/stimulus"
import axios from 'axios'
// 會去找node_modules裡的東西

export default class extends Controller {
  static targets = [ "loveCount" ]

  addLove(event) {
    event.preventDefault();

    let slug = event.currnetTarget.dataset.slug
    // <a data-action="post#addLove" data-slug="文章標題" href="#">
    // 這樣就可以 抓到data-slug屬性的值"文章標題" 

    axios.post(`/posts/${slug}/love`) // ES6
    // love_post     POST   /posts/:id/love(.:format)    posts#love
        .then(function(response){
            console.log(response.data)
        })
        .catch(function(error){
            console.log(error)
        })

    // let count = 0;
    // count += 1;
    // /posts/:id/love(.:format) 
    // this.loveCountTarget.innerHTML = 10;

    // let loveCount = this.loveCountTarget.value;
    // loveCount += 1;
  }

//   greet() {
//     const element = this.nameTarget
//     const name = element.value
//     console.log(`Hello, ${name}!`)
//   }
}