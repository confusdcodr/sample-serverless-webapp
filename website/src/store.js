import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

export default new Vuex.Store({
    plugins: [createPersistedState()],
    // define data for store
    state: {
        signedIn: false,
        user: null
    },
    // synchronous actions
    mutations: {
        signIn(state, payload) {
            state.signedIn = payload.signedIn
            state.user = payload.user
        },
        signOut(state) {
            state.signedIn = false
            state.user = null
        }
    },
    // asynchronous actions
    actions: {

    },
    // returns information about the state
    getters: {
        user(state) {
            return state.user;
        }
    }
});
