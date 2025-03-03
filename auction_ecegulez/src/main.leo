// The 'auction_ecegulez' program.
program auction_ecegulez.aleo {
    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    
    transition place_bid(bidder: address, amount: u64) -> Bid {
        assert_eq(self.caller, bidder);
        return Bid {
            owner: aleo1nzadmljn6gcavtkf0f5xmylqc5azy7sqth8va9lncj6t726vjvzsxh53ea,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    transition resolve(first: Bid, second: Bid) -> Bid {
        assert_eq(self.caller, aleo1nzadmljn6gcavtkf0f5xmylqc5azy7sqth8va9lncj6t726vjvzsxh53ea);
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

  
    transition finish(bid: Bid) -> Bid {
       
        assert_eq(self.caller, aleo1nzadmljn6gcavtkf0f5xmylqc5azy7sqth8va9lncj6t726vjvzsxh53ea);
    
        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }
}