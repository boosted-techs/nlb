new Vue({
    el : "#login",
    delimiters : ["%%", "%%"],
    data : function () {
        return {
            password: '',
            email: '',
            emailPlaceHolder: 'Eg john@email.com',
            passwordPlaceHolder: 'Password',
            errorMessage: '',
            inputSubmitButton: false,
            progressBar: 50,
            level: 0
        }
    },
    methods : {
        progress : function() {
            this.progressBar = ((this.level + 1) / 2) * 100
            if (this.level < 1) {
                if(this.level == 0) {
                    if  (! (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(this.email)))
                    {
                        this.errorMessage = "Your email address provided is not valid"
                        return
                    } else {
                        this.validateemail()
                    }
                }
                this.inputSubmitButton = true
            }
        },
        validateemail : function () {
            let instance = this
            let form = new FormData();
            form.append("email", this.email)
            axios({
                url : "//" + window.location.host + "/validate-email",
                method : "post",
                data : form
            }). then (function(response) {
                let data = response.data
                console.log(response.data)
                if (data === true) {
                    instance.errorMessage = "Welcome back."
                    instance.level++
                } else {
                    instance.errorMessage = "We have no account associated to this email."
                }
                instance.inputSubmitButton = false
            }) . catch (function (err){
                console.log(err)
            })
        },
        validatePassword : function () {
            let vue = this
            let form = new FormData();
            this.inputSubmitButton = true
            form.append("password", this.password)
            axios({
                method : "post",
                url : "//" + window.location.host + "/validate-password",
                data : form
            }) . then (function (response) {
                //console.log(response)
                data = response.data
                if (data == true) {
                    vue.progressBar = 100
                    window.location = "../p"
                    return
            }
                vue.inputSubmitButton = false
                vue.errorMessage = data
            }) . catch (function (err) {
                console.log(err)
            })
        }
    }
})


new Vue({
    el : "#resetPassword",
    delimiters: ["%%", "%%"],
    data : function (){
        return {
            email : '',
            emailPlaceholder : 'Your email address associated to your account',
            inputSubmitButton : false,
            errorMessage: false,
            progressBar : 50,
            passwordTwo : '',
            password : ''
        }
    },
    methods : {
        resetPassword : function () {
            let vue = this
            let form = new FormData
            form.append("email", this.email)
            this.inputSubmitButton = true
            this.errorMessage = false
            axios({
                method : 'post',
                url : "//" + window.location.host + "/send-recovery-mail",
                data : form
            }) . then(function (response) {
                if (response.data == true) {
                    vue.errorMessage = "A self destroying reset link has been sent to " + vue.email + ". Kindly check and gain access to your account.";
                    vue.progressBar = 100
                }else {
                    vue.errorMessage = response.data
                    vue.inputSubmitButton = false
                }
            })
        },
        newPassword : function() {
            let password = this.password
            let passwordTwo = this.passwordTwo
            vue = this
            this.inputSubmitButton = true
            this.errorMessage = false
            if (password == passwordTwo) {
                //0702650951
            }
        }
    }
})