const homeRightBar = {
    data () {
        return {
            serverName : window.location.host,
            adverts : ["Loading......"]
        }
    },
    mounted () {
        this.fetchAdverts()
    },
    methods : {
        fetchAdverts : function() {
            let vue = this
            axios({
                method : "post",
                url : "//" + vue.serverName + "/get-adverts",
                data : null
            }).
            then (function (response) {
                //console.log(response.data)
                vue.adverts = response.data
            }). catch(function(error) {

            })
        }
    },
    template : `
            <div class="col-lg-3 order-3">
                <aside class="widget-area">
                    <!-- widget single item start -->
                    <div class="card widget-item">
                        <h4 class="widget-title">Recent Notifications</h4>
                        <div class="widget-body">
                            <ul class="like-page-list-wrapper">
                                <li class="unorder-list">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-9.jpg'" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->

                                    <div class="unorder-list-info">
                                        <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                        <p class="list-subtitle">5 min ago</p>
                                    </div>
                                </li>
                                <li class="unorder-list">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-8.jpg'" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->

                                    <div class="unorder-list-info">
                                        <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                        <p class="list-subtitle">10 min ago</p>
                                    </div>
                                </li>
                                <li class="unorder-list">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-7.jpg'" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->

                                    <div class="unorder-list-info">
                                        <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                        <p class="list-subtitle">18 min ago</p>
                                    </div>
                                </li>
                                <li class="unorder-list">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-6.jpg'" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->

                                    <div class="unorder-list-info">
                                        <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                        <p class="list-subtitle">25 min ago</p>
                                    </div>
                                </li>
                                <li class="unorder-list">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-4.jpg'" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->

                                    <div class="unorder-list-info">
                                        <h3 class="list-title"><a href="#">Any one can join with us if you want</a></h3>
                                        <p class="list-subtitle">39 min ago</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- widget single item end -->
                    <div class="card widget-item">
                        <h4 class="widget-title">Advertizement</h4>
                        <div class="widget-body" v-for="list in adverts">
                            <div class="add-thumb">
                                <a v-bind:href="list.link">
                                    <img v-bind:src="list.image" :alt="list.company">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card widget-item">
                        <h4 class="widget-title">Friends Zone</h4>
                        <div class="widget-body">
                            <ul class="like-page-list-wrapper">
                                <li class="unorder-list">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-15.jpg'" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
    
                                    <div class="unorder-list-info">
                                        <h3 class="list-title"><a href="#">Ammeya Jakson</a></h3>
                                        <p class="list-subtitle"><a href="#">10 mutual</a></p>
                                    </div>
                                    <button class="like-button">
                                        <img class="heart" :src="'//' + serverName + '/assets/dashboard/images/icons/heart.png'" alt="">
                                        <img class="heart-color" :src="'//' + serverName + '/assets/dashboard/images/icons/heart-color.png'" alt="">
                                    </button>
                                </li>
                                <li class="unorder-list">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-18.jpg'" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
    
                                    <div class="unorder-list-info">
                                        <h3 class="list-title"><a href="#">Jashon Muri</a></h3>
                                        <p class="list-subtitle"><a href="#">2 mutual</a></p>
                                    </div>
                                    <button class="like-button active">
                                        <img class="heart" :src="'//' + serverName + '/assets/dashboard/images/icons/heart.png'" alt="">
                                        <img class="heart-color" :src="'//' + serverName + '/assets/dashboard/images/icons/heart-color.png'" alt="">
                                    </button>
                                </li>
                                <li class="unorder-list">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-14.jpg'" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
    
                                    <div class="unorder-list-info">
                                        <h3 class="list-title"><a href="#">Rolin Theitar</a></h3>
                                        <p class="list-subtitle"><a href="#">drama</a></p>
                                    </div>
                                    <button class="like-button">
                                        <img class="heart" :src="'//' + serverName + '/assets/dashboard/images/icons/heart.png'" alt="">
                                        <img class="heart-color" :src="'//' + serverName + '/assets/dashboard/images/icons/heart-color.png'" alt="">
                                    </button>
                                </li>
                                <li class="unorder-list">
                                    <!-- profile picture end -->
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img :src="'//' + serverName + '/assets/dashboard/images/profile/profile-35x35-20.jpg'" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <!-- profile picture end -->
    
                                    <div class="unorder-list-info">
                                        <h3 class="list-title"><a href="#">Active Mind</a></h3>
                                        <p class="list-subtitle"><a href="#">fitness</a></p>
                                    </div>
                                    <button class="like-button">
                                        <img class="heart" :src="'//' + serverName + '/assets/dashboard/images/icons/heart.png'" alt="">
                                        <img class="heart-color" :src="'//' + serverName + '/assets/dashboard/images/icons/heart-color.png'" alt="">
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- widget single item end -->
                </aside>
            </div>
    `
}