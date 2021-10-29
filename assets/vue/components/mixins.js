const getPosts = {
    data () {
        return {
            mediaUpdates : [],
            userData : [],
            hostName : "//" + window.location.host + "/",
        }
    },
    mounted() {
        this.eventBus.on("userData", (args) => {
            this.userData = args
        })
    }
}