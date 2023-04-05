document.addEventListener('turbolinks:load', function() {
    let fieldPassword = document.getElementById('user_password')
    let fieldConfirmPassword = document.getElementById('user_password_confirmation')

    if (fieldPassword && fieldConfirmPassword) {
        fieldPassword.addEventListener('input', Check)
        fieldConfirmPassword.addEventListener('input', Check)
    }
})

function Check() {
    if (document.getElementById('user_password_confirmation').value !== '') {
        if (document.getElementById('user_password').value ===
            document.getElementById('user_password_confirmation').value) {
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').innerHTML = 'matching';
        } else {
            document.getElementById('message').style.color = 'red';
            document.getElementById('message').innerHTML = 'not matching';
        }
    } else {
        document.getElementById('message').innerHTML = ''
    }

}
