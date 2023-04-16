document.addEventListener('turbolinks:load', function () {
  const question = document.querySelector('.question-number')
  const total = document.querySelector('.total-questions')

  if (question && total) {
    let questionNumber = question.dataset.questionNumber
    let totalQuestions = total.dataset.totalQuestions
    updateProgress(questionNumber, totalQuestions)
  }
})

const updateProgress = (questionNumber, totalQuestions) => {
  let progress = document.querySelector('.progress')
  let percent = (questionNumber / totalQuestions) * 100
   progress.style.width = percent + '%'
}