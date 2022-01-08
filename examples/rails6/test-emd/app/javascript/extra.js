var copy = function(target) {
    var textArea = document.createElement('textarea')
    textArea.setAttribute('style','width:1px;border:0;opacity:0;')
    document.body.appendChild(textArea)
    textArea.value = target.innerHTML
    textArea.select()
    document.execCommand('copy')
    document.body.removeChild(textArea)
}

//perform this after html is rendered
window.onload = function() {

    var pres = document.querySelectorAll(".code > pre")

    // var pres = document.querySelectorAll(".comment-body > pre")
    pres.forEach(function(pre){
      var button = document.createElement("button")
      button.className = "btn btn-sm"
      button.innerHTML = "copy"
      pre.parentNode.insertBefore(button, pre)
      button.addEventListener('click', function(e){
        e.preventDefault()
        //need to grab all the childnodes
        copy(pre.childNodes[0])
        console.log(pre)
        console.log(pre.childNodes[2])

      })
    })    
};


