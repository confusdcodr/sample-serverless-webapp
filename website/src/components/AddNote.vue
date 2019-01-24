<template>
<!-- Contact -->
<div id="notes" class="container pt-3">
    <div class="row">
        <div class="col-md-3">
        </div>

        <div class="col-md-6">
            <form>
                <div class="form-group">
                  <label for="exampleInputEmail1">Note:</label>
                  <textarea v-model="note" placeholder="add note here..." class="form-control" rows="3"></textarea>
                </div>
                <input type="submit" value="Add Note" class="btn btn-primary" v-on:click="addNote()">
            </form>
        </div>

        <div class="col-md-3">

        </div>
    </div>
</div>
</template>

<script>
export default {
    name: 'mynotes',
    data () {
        return {
            note: '' 
        }
    },
    mounted:function(){
    },
    methods: {
        addNote: function () {
            if(this.note === "") {
                return
            }
           
            if(this.$store.state.user) {
                const jwt = this.$store.state.user
                    .getSignInUserSession()
                    .getIdToken()
                    .getJwtToken();
 
                console.log(jwt)

                this.$http({
                    method: 'post',
                    url: this.$config.baseURI,
                    data: {
                        text: this.note
                    },
                    headers: {
                        Authorization: jwt 
                    },
                    withCredentials: false
                })
                .then(function (response) {
                    console.log(response);
                })
                .catch(function (error) {
                    console.log(error);
                });
            } else {
                this.$http.post(this.$config.baseURI, {
                    text: this.note    
                })
                .then(function (response) {
                    console.log(response);
                })
                .catch(function (error) {
                    console.log(error);
                });
            }
        }
    }
}
</script>

<style>
</style>
