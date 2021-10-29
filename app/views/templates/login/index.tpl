{extends file="index.tpl"}
{block name="body"}
    <div class="login-box wow fadeIn" id="login-search-box">
        <div class="login-search-box-a"  style="overflow-y: auto; padding-left: 20px; padding-right: 20px;">
            <div class="col-md-4 mx-auto shadow login-box-search-box-form rounded p-3">
                <h1 class="text-center">N<span class="text-danger">L</span>B</h1>
                <div>
                     <div>
                         <div v-if="error" class="text-center bg-danger p-3">%%error%%</div>
                        <h5 class="text-center mt-4"></h5>
                        <div class="row mt-4">
                        <div class="col-md-12">
                            <label>Email</label>
                            <input type="email" v-model:trim="email" placeholder="eg shadia@nlb.com" class="form-control no-border mt-2 mb-2"/>
                        </div>
                        <div class="col-md-12">
                            <label>Password</label>
                            <input type="password" v-model="password" placeholder="***************" class="form-control no-border mt-2 mb-2"/>
                        </div>
                        <div class="col-md-12 mt-2">
                            <button class="btn btn-danger form-control rounded-0 shadow" @click="login"  :disabled="inputSubmitDisabled">LOGIN</button>
                            <p class="text-center pt-3">The News Light Board</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}