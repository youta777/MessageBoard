Rails.application.routes.draw do

  root to: 'messages#index' # トップページ

  resources :messages, except: [:index]
  
  #　resourcesの中身(RESTful)
  # get 'messages', to 'messages#index' #一覧
  # get 'messages/:id', to 'message#show' # 詳細
  # get 'messages/new', to 'messages#new' # 新規作成
  # post 'messages', to 'messages#create' # 新規作成メソッド
  # get 'messages/:id/edit', to 'messages#index' # 編集
  # put 'messages/:id', to 'messages#update' #上書きメソッド
  # delete 'messages/:id', to 'messages#destroy' # 削除メソッド


end
