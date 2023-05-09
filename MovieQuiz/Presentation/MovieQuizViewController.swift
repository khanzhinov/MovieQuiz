import UIKit

final class MovieQuizViewController: UIViewController {
    
    
    //1. аутлеты для UI элементов
    
    //связи для картинки, текста, счетчика
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    
    //2. структуры, энумы
    
    struct QuizQuestion {
        // строка с названием фильма,
        // совпадает с названием картинки афиши фильма в Assets
        let image: String
        // строка с вопросом о рейтинге фильма
        let text: String
        // булевое значение (true, false), правильный ответ на вопрос
        let correctAnswer: Bool
    }
    
    // вью модель для состояния "Вопрос показан"
    struct QuizStepViewModel {
        // картинка с афишей фильма с типом UIImage
        let image: UIImage
        // вопрос о рейтинге квиза
        let question: String
        // строка с порядковым номером этого вопроса (ex. "1/10")
        let questionNumber: String
    }
    
    
    //3. Переменные, константы
    
    private let questions: [QuizQuestion] = [
        QuizQuestion(
            image: "The Godfather",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Dark Knight",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Kill Bill",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Avengers",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Deadpool",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Green Knight",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Old",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Tesla",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Vivarium",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false)
    ]
    
    let text: String = ""
    
    let correctAnswer: Bool
    
    let alert = UIAlertController(
        title: "Этот раунд окончен!",
        message: "Ваш результат ???",
        preferredStyle: .alert)
    
    let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
        self.currentQuestionIndex = 0
        // сбрасываем переменную с количеством правильных ответов
        self.correctAnswers = 0
        
        // заново показываем первый вопрос
        let firstQuestion = self.questions[self.currentQuestionIndex]
        let viewModel = self.convert(model: firstQuestion)
        showAlert ()
        self.show(quiz: viewModel)
    }
    
    let alert = UIAlertController(
        title: "Этот раунд окончен!",
        message: "Ваш результат ???",
        preferredStyle: .alert)
    
    alert.addAction(action)
    
    self.present(alert, animated: true, completion: nil)
}

//переменная текущего вопроса

private var currentQuestionIndex = 0

//переменная со счетчиком правильных ответов

private var correctAnswers = 0

//4.  Мока данные

/*
 Mock-данные
 
 
 Картинка: The Godfather
 Настоящий рейтинг: 9,2
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Dark Knight
 Настоящий рейтинг: 9
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Kill Bill
 Настоящий рейтинг: 8,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Avengers
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Deadpool
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Green Knight
 Настоящий рейтинг: 6,6
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Old
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: The Ice Age Adventures of Buck Wild
 Настоящий рейтинг: 4,3
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: Tesla
 Настоящий рейтинг: 5,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: Vivarium
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 */

//5. viewDidLoad()

override func viewDidLoad () {
    let currentQuestion = questions[currentQuestionIndex]
    let elements = convert(model: currentQuestion)
    show (quiz: elements)
    
}

//6. Актив кнопок

@IBAction private func yesButtonClicked(_ sender: UIButton) {
    let currentQuestion = questions[currentQuestionIndex]
    let givenAnswer = true
    
    showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
}

@IBAction private func noButtonClicked(_ sender: UIButton) {
    let currentQuestion = questions[currentQuestionIndex]
    let givenAnswer = false
    
    showAnswerResult(isCorrect: givenAnswer == currentQuestion.correctAnswer)
}

//7. Методы

    
// приватный метод конвертации, который принимает моковый вопрос и возвращает вью модель для главного экрана
private func convert(model: QuizQuestion) -> QuizStepViewModel {
    let questionStep = QuizStepViewModel(
        image: UIImage(named: model.image) ?? UIImage(),
        question: model.text,
        questionNumber: "\(currentQuestionIndex + 1)/\(questions.count)")
    return questionStep
}


// приватный метод вывода на экран вопроса, который принимает на вход вью модель вопроса и ничего не возвращает
private func show(quiz step: QuizStepViewModel) {
    imageView.image = step.image
    textLabel.text = step.question
    counterLabel.text = step.questionNumber
    return
}

private func show(quiz result: QuizResultsViewModel) {
    let alert = UIAlertController(
        title: result.title,
        message: result.text,
        preferredStyle: .alert)
    
    let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
        self.currentQuestionIndex = 0
        self.correctAnswers = 0
        
        let firstQuestion = self.questions[self.currentQuestionIndex]
        let viewModel = self.convert(model: firstQuestion)
        self.show(quiz: viewModel)
    }
    
    alert.addAction(action)
    
    self.present(alert, animated: true, completion: nil)
}
    
    // приватный метод, который меняет цвет рамки
// принимает на вход булевое значение и ничего не возвращает
private func showAnswerResult(isCorrect: Bool) {
    imageView.layer.masksToBounds = true // 1
    imageView.layer.borderWidth = 8 // 2
    imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor // 3
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        self.showNextQuestionOrResults()
    }
}
    
/*private func showAnswerResult(isCorrect: Bool) {
    if isCorrect { // 1
        correctAnswers += 1
    }
    
    imageView.layer.masksToBounds = true
    imageView.layer.borderWidth = 8
    imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { _
        in
        self.showNextQuestionOrResults()
        
    }
}
*/
    
// приватный метод, который содержит логику перехода в один из сценариев
// метод ничего не принимает и ничего не возвращает
private func showNextQuestionOrResults() {
    if currentQuestionIndex == questions.count - 1 {
        // идём в состояние "Результат квиза"
    } else {
        currentQuestionIndex += 1
        
        let nextQuestion = questions[currentQuestionIndex]
        let viewModel = convert(model: nextQuestion)
        
        show(quiz: viewModel)
    }
}


/*private func showNextQuestionOrResults() {
    if currentQuestionIndex == questions.count - 1 {
        let text = "Ваш результат: \(correctAnswers)/10"
        let viewModel = QuizResultsViewModel(
            title: "Этот раунд окончен!",
            text: text,
            buttonText: "Сыграть ещё раз")
        show(quiz: viewModel) // 3
    } else {
        currentQuestionIndex += 1
        let nextQuestion = questions[currentQuestionIndex]
        let viewModel = convert(model: nextQuestion)
        
        show(quiz: viewModel)
    }
}
/*




























