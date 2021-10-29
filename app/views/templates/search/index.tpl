{extends file="index.tpl"}
{block name="body"}
    <div class="create-account" id="createAccount" style="overflow-y: auto">
        <div class="creator-header shadow">
            <div class="create-account-loader" {literal}:style="{width: progressBar + '%'}"{/literal}>
        </div>
        <div class="create-account-body">
            <div class="col-md-6 mx-auto mt-3 p-5">
                <div v-if="level == 0">
                    <h1>Hi, lets get started!</h1>
                    <h4 class="font-weight-light pt-2 mb-4">What is your Birth date?</h4>
                    <input type="date" class="login-form-input" v-model="dateOfBirth" @change='progress'/>
                </div>
                <div v-else-if="level == 1">
                    <h4>Now that your date of birth is %% dateOfBirth%% </h4>
                    <h1 class="mt-4 mb-4">How should we call you?</h1>
                    <input type="text" class="login-form-input" v-model.trim="names" @keyup="watchKeyUps('names')" :placeholder="namePlaceHolder" />
                    <button class="btn btn-danger rounded-0 shadow mt-3 float-end" @click="progress" :disabled="inputSubmitDisabled">That's Okay</button>

                </div>
                <div v-else-if="level == 2">
                    <h4>Wow, %% names %%, let's get straight to your next love life </h4>
                    <h1 class="mt-4 mb-4">What is your email?</h1>
                    <input type="text" class="login-form-input" v-model.trim="email" @keyup="watchKeyUps('email')" :placeholder="emailPlaceHolder" />
                    <button class="btn btn-danger rounded-0 shadow mt-3 float-end" @click="progress" :disabled="inputSubmitDisabled">That's Okay</button>

                </div>
                <div v-else-if="level == 3">
                    <h5>Alright %% names %%, so far you are doing great.<br/><br/>We are to use <b>%% email %%</b> to get you connected to your next love life. </h5>
                    <h1 class="mt-4 mb-4">Are you a male or Female?</h1>
                    <select class="login-form-input mt-4" v-model="gender" @change="watchKeyUps('gender')">
                        <option value="">Select gender</option>
                        <option value="male">I am Male</option>
                        <option value="female">I am a female</option>
                    </select>
                    <button class="btn btn-danger rounded-0 shadow mt-3 float-end" @click="progress" :disabled="inputSubmitDisabled">That's Okay</button>
                </div>
                <div v-else-if="level == 4">
                    <h4>Okay %% names %%, that looks fine so far. </h4>
                    <h1 class="mt-4 mb-4">From which city do you come from?</h1>
                    <input type="text" class="login-form-input p-2" v-model.trim="location" :placeholder="locationPlaceHolder" v-on:keyup="matchByLocation"/>
                    {*                                <component v-bind:is="view" ></component>*}
                    <div class="w-100 p-2 bg-white p-4 shadow" v-if="dropDown" id="locationResults">
                        <ul class='list-group'>
                            <li class="list-group-item clickable" v-for="location in locationReturnedList" v-on:click="selectLocation(location.id, location.city, location.country)">
                                %% location.city %% <small class="text-muted" style="text-size:10px"> - %% location. country %%</small>
                            </li>
                        </ul>
                    </div>
                    <button class="btn btn-danger rounded-0 shadow mt-3 float-end" @click="progress" :disabled="inputSubmitDisabled">That's Okay</button>

                </div>
                <div v-else-if="level == 5">
                    <h4 class="mt-4 mb-4">%% names %%, you can now Choose a password to secure your account. </h4>
                    <input type="password" class="login-form-input" v-model="password" @keyup="watchKeyUps('password')" :placeholder="passwordPlaceHolder" />
                    <button class="btn btn-danger rounded-0 shadow mt-3 float-end" @click="progress" :disabled="inputSubmitDisabled">That's Okay</button>

                </div>
                <div v-else-if="level == 6" class="text-center">
                    <h4>%% names %%, %% message %%</h4>
                    <button class="btn btn-danger rounded-0 shadow mt-3" :disabled="inputSubmitDisabled" @click="createAccount">Get me in now</button>
                </div>
                <p v-if="errorMessage"><small><b>%% errorMessage %%</b></small></p>
                <a href="//{$smarty.server.SERVER_NAME}/" class="float-end mt-2 text-dark" style="margin-right: 15px !important;">HOME</a>
                <a href="//{$smarty.server.SERVER_NAME}/login" class="float-end mt-2 text-dark" style="margin-right: 15px !important;">LOGIN</a>
             </div>
        </div>
    </div>
{/block}