<template>
<div id="signup" class="container pt-3">
    <div class="row">
        <div class="col-md-3">
        </div>

        <div class="col-md-6">
            <div v-if="!signedIn">
                <amplify-authenticator v-bind:authConfig="authConfig"></amplify-authenticator>
            </div>
            <div v-if="signedIn">
                <amplify-sign-out></amplify-sign-out>
            </div>
        </div>

        <div class="col-md-3">

        </div>
    </div>
</div>
</template>

<script>
import { Auth } from 'aws-amplify';
import { AmplifyEventBus } from 'aws-amplify-vue';

export default {
    name: 'signup',
    data() {
        return {
            authConfig: {
                signUpConfig: {
                    hideAllDefaults: false,
                    hiddenDefaults: ["phone_number", "email"]
                }
            }
        }
    },
    computed: {
        signedIn() {
            return this.$store.state.signedIn;
        }
    },
    created() {
        this.findUser();
        
        AmplifyEventBus.$on('authState', info => {
            if(info === "signedIn") {
                this.findUser();
            } else {
                this.$store.state.signedIn = false;
                this.$store.state.user = null;
            }
        });
    },
    methods: {
        async findUser() {
            try {
                const user = await Auth.currentAuthenticatedUser();
                this.$store.commit('signIn', {user: user, signedIn: true});
                this.$router.push({ name: 'Home', query: { redirect: '/' } });
            } catch (err) {
                this.$store.state.signedIn = false;
                this.$store.state.user = null;
            }
        }
    }
}
</script>
