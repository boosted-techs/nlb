const profileMainContent = {
    data () {
        return {
            mediaUpdates : []
        }
    },
    mounted() {
        this.eventBus.on("media", (args) => {
            this.mediaUpdates = args
            console.log(this.mediaUpdates)
        })
        //window.location.reload()
    },
    template : `
        <div class="col-lg-6 order-1 order-lg-2">
                        <!-- share box start -->
            <div class="card card-small">
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
                        <form class="share-text-box">
                            <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Say Something" data-bs-toggle="modal" data-bs-target="#textbox" id="email"></textarea>
                            <button class="btn-share" type="submit">share</button>
                        </form>
                    </div>
                    <!-- share content box end -->
                    <!-- Modal start -->
                    <div class="modal fade" id="textbox" aria-labelledby="textbox">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Share Your Mood</h5>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body custom-scroll">
                                    <textarea name="share" class="share-field-big custom-scroll" placeholder="Say Something"></textarea>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="post-share-btn" data-bs-dismiss="modal">cancel</button>
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
            <div class="card no-padding no-margin-sm" v-for="list in mediaUpdates">
                <!-- post title start -->
                <div class="post-title d-flex align-items-center">
                    <!-- profile picture end -->
                    <div class="profile-thumb">
                        <a href="#">
                            <figure class="profile-thumb-middle">
                                 <img :src="hostName + 'profile_pics/' + list.profile" class="w-100" :alt="list.names"/>
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
                                <img :src="hostName + 'media/' + list.image"  :alt="list.names">
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

/*
Separate the Profile navigation for sharing purposes with other pages that may need the same data eg about us page
 */
const profileMainNavigation = `
        
            <div class="main-wrapper">
                <div class="profile-banner-large bg-img" data-bg="../../assets/dashboard/images/banner/profile-banner.jpg"></div>
                    <div class="profile-menu-area bg-white">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-lg-3 col-md-3">
                                    <div class="profile-picture-box">
                                        <figure class="profile-picture">
                                            <rounter-link to="/profile">
                                                <img :src="hostName + 'assets/dashboard/images/profile/profile-1.jpg'" alt="profile picture">
                                            </rounter-link>
                                        </figure>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 offset-lg-1">
                                    <div class="profile-menu-wrapper">
                                        <div class="main-menu-inner header-top-navigation">
                                            <nav>
                                                <ul class="main-menu">
                                                    <li class="active"><router-link to="/p">timeline</router-link></li>
                                                    <li><router-link to="/p/bio">about</router-link></li>
                                                    <li><router-link to="/p/photos">photos</router-link></li>
                                                    <li><router-link to="/p/people">friends</router-link></li>
                                                    <li><router-link to="/p/settings">settings</a></li>
                                                    <!-- <li class="d-inline-block d-md-none"><a href="profile.html">edit profile</a></li> -->
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-3 d-none d-md-block">
                                    <div class="profile-edit-panel">
                                        <button class="edit-btn">edit profile</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <left-bar></left-bar>
                            <home></home>
                            <right-bar></right-bar>
                        </div>
                   </div>
                </div>
            </div>
`