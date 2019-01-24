<template>
    <!-- Contact --> 
    <div id="contact" class="container pt-3">
        <div class="row">
            <div class="col-md-3">
            </div>
            
            <div class="col-md-6">
                <h2>Contact Me:</h2>
                <p>
                    Email: {{email}}
                </p>
                <p>
                    Website: {{web}}
                </p>
            </div>
                
            <div class="col-md-3">

            </div>
        </div>
    </div>
</template>

<script>
export default {
  data(){
    return {
      email: "gregory.owens@plus3it.com",
      web: "https://plus3it.com"
    }
  }
}
</script>
