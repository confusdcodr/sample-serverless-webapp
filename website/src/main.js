import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import Amplify, * as AmplifyModules from 'aws-amplify'
import { AmplifyPlugin } from 'aws-amplify-vue'


import Config from './config'
import Navigation from './components/Navigation'

Amplify.configure({
    Auth: {
        // REQUIRED - Amazon Cognito Region
        region: 'us-east-1',

        // OPTIONAL - Amazon Cognito User Pool ID
        userPoolId: '',
        userPoolWebClientId: '',
        mandatorySignIn: false,
    }
});

Vue.use(AmplifyPlugin, AmplifyModules)
Vue.prototype.$config = Config
Vue.prototype.$http = axios
Vue.config.productionTip = false

new Vue({
    el: '#app',
    components: {
        'Navigation': Navigation
    },
    store,
    router,
    render: h => h(App),
}).$mount('#app')
