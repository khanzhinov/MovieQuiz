import UIKit

final class MovieQuizViewController: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
    }
    
    
    //переменная текущего вопроса
    
    private var currentQuestionIndex = 0
    
    //переменная со счетчиком правильных ответов
    
    private var correctAnswers = 0
    
    
    
    
    //структуры
    
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
    
 
    
    //массив
    
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
    
    
    //функции кнопок
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        
    }
    
    
    //связи для картинки, текста, счетчика
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    
    
    // метод конвертации, который принимает моковый вопрос и возвращает вью модель для экрана вопроса
   
        
        
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
    }
