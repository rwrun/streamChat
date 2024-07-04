//error nil

import Foundation

protocol MessageListViewPresenterProtocol: AnyObject{
    var chatList: [ChatItem] { get set }
}

class MessageListViewPresenter: MessageListViewPresenterProtocol{
    var chatList: [ChatItem] = []
    
    private let messageListManager = MessageListManager()
    weak var view: MessageListViewProtocol?
    
    init(view: MessageListViewProtocol?) {
        self.view = view
        
        getChatList()
    }
    
    func getChatList(){
        messageListManager.getChatList { [weak self] chatList in
            guard let self = self else { return }
            
            self.chatList = chatList
            
            self.view?.reloadTable()
        }
    }
    
}
