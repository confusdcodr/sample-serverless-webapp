<template>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <router-link class="navbar-brand" to="/">Notes</router-link>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav mr-auto">
            <router-link class="nav-item nav-link" to="/addnote">Add Note</router-link>
            <router-link class="nav-item nav-link" to="/contact">Contact</router-link> 
        </div>
    
        <div v-if="!this.signedIn" class="navbar-nav ml-auto">
            <router-link :to="{name: 'Signup'}">
                <button id="myButton" class="btn btn-primary">Sign Up</button>
            </router-link>
        </div> 
        
        <div v-if="this.signedIn" class="navbar-nav ml-auto">
            <input type="submit" value="Sign Out" class="btn btn-danger" v-on:click="$emit('signout')">
        </div> 
    </div>
</nav>
</template>

<script>
export default {
    name: "Navigation",
    props: ['signedIn'],
    data: function() {
        return {
        
        }   
    }
}
</script>
