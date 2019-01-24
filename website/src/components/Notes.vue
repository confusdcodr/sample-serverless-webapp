<template>
<!-- Contact -->
<div id="notes" class="container pt-3">
    <div class="row">
        <div class="col-md-3">
        </div>

        <div class="col-md-6">
            <input type="submit" value="Refresh Notes" v-on:click="fetchNotes()">
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
            const baseURI = 'https://dbk11spqng.execute-api.us-east-1.amazonaws.com/dev/notes'

            this.$http.get(baseURI)
              .then((result) => {
                  this.notes = result.data
            })
        }
    }
}
</script>

<style>
</style>
