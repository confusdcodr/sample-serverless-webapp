<template>
<div id="home" class="container pt-3">
    <div class="row">
        <div class="col-md-3">
        </div>

        <div class="col-md-6">
            <input type="submit" class="btn btn-primary" value="Refresh Notes" v-on:click="fetchNotes()">
            <div v-for="note in notes">
                <br/>
                <div class="card">
                    <div class="card-header">
                        {{ note.userId }}
                    </div>
                    <div class="card-body">
                        <p class="card-text">{{ note.text }}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3">

        </div>
    </div>
</div>
</template>

<script>
export default {
    name: 'notes',
    data () {
        return {
            notes: []
        }
    },
    mounted:function(){
        this.fetchNotes()
    },
    methods: {
        fetchNotes: function () {
            this.$http.get(this.$config.baseURI)
              .then((result) => {
                  this.notes = result.data
            })
        }
    }
}
</script>

<style>
</style>
