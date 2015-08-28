module Lita
  module Handlers
    class Punish < Handler
      SNARK = [
        "*ahem*",
        "rly?",
        "SHH",
        "ಠ_ಠ",
      ]

      route /^(?!TIL)/i, :punish
      route /roome/, :roome, command: true

      def punish(response)
        room = ENV.fetch("LITA_PUNISH_ROOM", "lolwat")

        if response.message.source.room == room
          response.reply SNARK.sample
        end
      end

      def roome(response)
        response.reply_privately response.message.source.room
      end

      Lita.register_handler(self)
    end
  end
end
