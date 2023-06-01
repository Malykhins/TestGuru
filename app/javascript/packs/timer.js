document.addEventListener('turbolinks:load', () => {
    const timerElement = document.getElementById('timer');

    if (timerElement && timerElement.dataset.testTime) {
        const timeLimit = timerElement.dataset.testTime * 60;
        testTimer(timeLimit);
    } else if (window.location.href !== localStorage.getItem('timerUrl')) {
        localStorage.removeItem('startTime');
        localStorage.removeItem('timerUrl');
    }

    function testTimer(timeLimit) {
        let startTime = localStorage.getItem('startTime') || new Date().getTime();
        localStorage.setItem('startTime', startTime);

        let currentUrl = localStorage.getItem('timerUrl') || window.location.href;
        localStorage.setItem('timerUrl', currentUrl);

        let timer = setInterval(() => {
            let elapsedTime = Math.floor((new Date().getTime() - startTime) / 1000);
            let remainingTime = timeLimit - elapsedTime;

            if (remainingTime <= 0 && window.location.href === currentUrl) {
                clearInterval(timer);
                localStorage.removeItem('startTime');
                localStorage.removeItem('timerUrl');
                alert('Время вышло!');
                window.location.href = `${currentUrl}/result`;
            } else {
                let minutes = Math.floor((remainingTime / 60) % 60);
                let seconds = remainingTime % 60;
                timerElement.innerHTML = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
            }
        }, 1000);
    }
});

