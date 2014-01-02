module Conekta
  class Charge < Resource
    include Conekta::Operations::Get
    include Conekta::Operations::Where
    include Conekta::Operations::Create
    include Conekta::Operations::CustomAction
    def capture
      custom_action(:post, 'capture', nil)
    end
    def refund(params=nil)
      if params == nil
        params = {"amount" => self.amount}
      end
      custom_action(:post, 'capture', params)
    end
  end
end