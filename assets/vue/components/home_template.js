const homeComponent = {
    data (){
        return {
        profilePic : "//" + window.location.host + "/profile_pics/",
            mediaUpdates: []
        }
    },
    methods : {

    },

    mounted() {
        this.eventBus.on("media", (args) => {
            this.mediaUpdates = args
        })
    },

    template : `
         <!-- post status start -->
         <div class="col-lg-6 order-1 order-lg-2 fixed-scrollable">
                        <!-- share box start -->
            <div class="card card-small shadow">
                <div class="share-box-inner">
                    <!-- profile picture end -->
                    <div class="profile-thumb">
                        <a href="#">
                            <figure class="profile-thumb-middle">
                                <img :src="hostName + 'profile_pics/' + userData.image" :alt="userData.names">
                            </figure>
                        </a>
                    </div>
                    <!-- profile picture end -->

                    <!-- share content box start -->
                    <div class="share-content-box w-100">
                        <form class="share-text-box" action="#">
                            <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Say Something" data-bs-toggle="modal" data-bs-target="#textbox" id="email"></textarea>
                            <button class="btn-share" type="submit" data-bs-toggle="modal" data-bs-target="#textbox">Share</button>
                        </form>
                    </div>
                    <!-- share content box end -->

                    <!-- Modal start -->
                    <div class="modal fade" id="textbox" aria-labelledby="textbox">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title theme-color text-center">What do you tell us today?</h5>
                                    <button type="button" class="close theme-color" data-bs-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body custom-scroll no-padding border">
                                    <textarea name="share" class="share-field-big custom-scroll big-text-font border-0" placeholder="Say Something"></textarea>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="post-share-btn post-share-btn-2" data-bs-dismiss="modal">cancel</button>
                                    <button type="button" class="post-share-btn">post</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
            </div>
            <!-- share box end -->

            <!-- post status start -->
            <div class="card no-padding" v-for="list in mediaUpdates">
                <!-- post title start -->
                <div class="post-title d-flex align-items-center">
                    <!-- profile picture end -->
                    <div class="profile-thumb">
                        <a href="#">
                            <figure class="profile-thumb-middle">
                                 <img v-bind:src="hostName + 'profile_pics/' + list.profile" class="w-100" :alt="list.names"/>
                            </figure>
                        </a>
                    </div>
                    <!-- profile picture end -->

                    <div class="posted-author">
                        <h6 class="author"><a href="profile.html">{{list.names}}</a></h6>
                        <span class="post-time">20 min ago</span>
                    </div>

                    <div class="post-settings-bar">
                        <span></span>
                        <span></span>
                        <span></span>
                        <div class="post-settings arrow-shape">
                            <ul>
                                <li><button>copy link to adda</button></li>
                                <li><button>edit post</button></li>
                                <li><button>embed adda</button></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- post title start -->
                <div class="post-content">
                    <p class="post-desc">
                       {{list.description}}
                    </p>
                    <div class="post-thumb-gallery">
                        <figure class="post-thumb img-popup">
                            <a class="gallery-selector" :href="hostName + 'media/' + list.image">
                                <img v-bind:src="hostName + 'media/' + list.image"  :alt="list.names">
                            </a>
                        </figure>
                    </div>
                    <div class="post-meta">
                        <button class="post-meta-like">
                            <i class="bi bi-heart-beat"></i>
                            <span>You and 201 people like this</span>
                            <strong>201</strong>
                        </button>
                        <ul class="comment-share-meta">
                            <li>
                                <button class="post-comment">
                                    <i class="bi bi-chat-bubble"></i>
                                    <span>41</span>
                                </button>
                            </li>
                            <li>
                                <button class="post-share">
                                    <i class="bi bi-share"></i>
                                    <span>07</span>
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- post status end -->
        </div>  
        `
}