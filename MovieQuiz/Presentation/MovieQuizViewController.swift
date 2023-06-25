import UIKit

final class MovieQuizViewController: UIViewController, QuestionFactoryDelegate, AlertPresenterDelegate {
    
    func didReceiveNextQuestion(question: QuizQuestion?) {
        presenter.didRecieveNextQuestion(question: question)
    }
    
 
    // MARK: - Lifecycle
    
    
    @IBOutlet weak private var countLabel: UILabel!
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var textLabel: UITextView!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    //private let questionsAmount: Int = 10
    private var questionFactory: QuestionFactoryProtocol?
    private var currentQuestion: QuizQuestion?
    private var alertPresenter: AlertPresenter?
    //private var currentQuestionIndex: Int = 0
    private var correctAnswers: Int = 0
    private var answer: Bool = true
    private var statisticService: StatisticService?
    private let presenter = MovieQuizPresenter()
    
    private enum FileManagerError: Error {
        case fileDoesntExist
    }
    
    private enum ParseError: Error {
        case yearFailure
        case runtimeMinsFailure
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        presenter.yesButtonClicked()
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        presenter.noButtonClicked()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 20
        presenter.viewController = self
        alertPresenter = AlertPresenter()
        alertPresenter?.controller = self
        questionFactory = QuestionFactory(moviesLoader: MoviesLoader())
        questionFactory?.delegate = self
        questionFactory?.requestNextQuestion()
        statisticService = StatisticServiceImplementation()
        
        questionFactory?.loadData()
        showLoadingIndicator()
    }
    
 
    /*func didRecieveNextQuestion(question: QuizQuestion?) {
            presenter.didRecieveNextQuestion(question: question)
        }
    */
    // MARK: - AlertPresenterDelegate
    
    func didPresentAlert(alert: UIAlertController?) {
        guard let alert = alert else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAnswerResult(isCorrect: Bool) {
        
        if isCorrect {
            correctAnswers += 1
        }
        
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = isCorrect ? UIColor.YP
            .cgColor : UIColor.pink.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.showNextQuestionOrResults()
            
        }
    }
    
    func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        countLabel.text = step.questionNumber
        imageView.layer.borderWidth = 0
    }
    
    private func showNextQuestionOrResults() {
        
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 0
        
        if presenter.currentQuestionIndex == presenter.questionsAmount - 1 {
            statisticService?.store(correct: correctAnswers, total: presenter.questionsAmount)
            guard let gamesCount = statisticService?.gamesCount else {return}
            guard let bestGame = statisticService?.bestGame else {return}
            guard let totalAccuracy = statisticService?.totalAccuracy else {return}
            
            alertPresenter = AlertPresenter()
            alertPresenter?.controller = self
            let alertModel = AlertModel(
                title: "Этот раунд окончен!",
                message: """
                 Ваш результат: \(correctAnswers)/\(presenter.questionsAmount)
                 Количество сыгранных квизов: \(gamesCount)
                 Рекорд: \(bestGame.correct)/\(bestGame.total) (\(bestGame.date.dateTimeString))
                 Средняя точность: \(String(format: "%.2f", totalAccuracy))%
                 """,
                buttonText: "Сыграть ещё раз",
                completion: { [weak self] _ in
                    guard let self = self else { return }
                    self.correctAnswers = 0
                    self.presenter.currentQuestionIndex = 0
                    self.questionFactory?.requestNextQuestion()
                })
            
            alertPresenter?.show(alert: alertModel)
        } else {
            presenter.currentQuestionIndex += 1
            questionFactory?.requestNextQuestion()
        }
    }
    
    /*private func convert(model: QuizQuestion) -> QuizStepViewModel {
        return QuizStepViewModel(
            image: UIImage(data: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)")
    }
    */
    

    
    private func showLoadingIndicator() {
        activityIndicator.isHidden = false // говорим, что индикатор загрузки не скрыт
        activityIndicator.startAnimating() // включаем анимацию
    }
    
    
    private func hideLoadingIndicator() {
        activityIndicator.isHidden = true
    }
    
    private func showNetworkError(message: String) {
        hideLoadingIndicator()
        
        let alertError = UIAlertController(
            title: "Что-то пошло не так(",
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(title: "Попробовать еще раз?",
                                   style: .default) { _ in
            
            
            self.questionFactory = QuestionFactory(moviesLoader: MoviesLoader())
            
            self.questionFactory?.delegate = self
            
            self.statisticService = StatisticServiceImplementation()
            
            self.questionFactory?.loadData()
            
            self.showLoadingIndicator()
            
        }
        alertError.addAction(action)
        self.present(alertError, animated: true, completion: nil)
    }
    
    
    func didFailToLoadData(with error: Error) {
        showNetworkError(message: error.localizedDescription) // возьмём в качестве сообщения описание ошибки
    }
    
    func didLoadDataFromServer() {
        activityIndicator.isHidden = true // скрываем индикатор загрузки
        questionFactory?.requestNextQuestion()
    }
}

