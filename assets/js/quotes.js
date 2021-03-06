new Clipboard(".copy");

var quotes = getQuotes();

quotes.forEach(function (quote, index) {
    var container = document.createElement("div");
    container.classList.add("container");

    var p = document.createElement("p");
    p.setAttribute("id", "quote-" + index);
    p.innerHTML = quote.content + "</br> ~ <i>" + quote.author + "</i>";

    var btn = document.createElement("button");
    btn.innerHTML = '<i class="fa fa-clipboard" aria-hidden="true"></i>';
    btn.setAttribute("data-clipboard-target", "#quote-" + index);
    btn.classList.add("copy");

    container.appendChild(p);
    container.appendChild(btn);
    document.body.appendChild(container);
});

function getQuotes() {
    // quotes offered by lists.design
    // http://lists.design/lists/json/quotes.json
    var quotesRaw = JSON.parse(
        '[{"data":"Life is about making an impact, not making an income. -Kevin Kruse"},{"data":"Whatever the mind of man can conceive and believe, it can achieve. â€“Napoleon Hill"},{"data":"Strive not to be a success, but rather to be of value. â€“Albert Einstein"},{"data":"Two roads diverged in a wood, and I took the one less traveled by, And that has made all the difference. â€“Robert Frost"},{"data":"I attribute my success to this: I never gave or took any excuse. â€“Florence Nightingale"},{"data":"You miss 100% of the shots you donâ€™t take. â€“Wayne Gretzky"},{"data":"I\'ve missed more than 9000 shots in my career. I\'ve lost almost 300 games. 26 times I\'ve been trusted to take the game winning shot and missed. I\'ve failed over and over and over again in my life. And that is why I succeed. â€“Michael Jordan"},{"data":"The most difficult thing is the decision to act, the rest is merely tenacity. â€“Amelia Earhart"},{"data":"Every strike brings me closer to the next home run. â€“Babe Ruth"},{"data":"Definiteness of purpose is the starting point of all achievement. â€“W. Clement Stone"},{"data":"Life isn\'t about getting and having, it\'s about giving and being. â€“Kevin Kruse"},{"data":"Life is what happens to you while youâ€™re busy making other plans. â€“John Lennon"},{"data":"We become what we think about. â€“Earl Nightingale"},{"data":"Twenty years from now you will be more disappointed by the things that you didnâ€™t do than by the ones you did do, so throw off the bowlines, sail away from safe harbor, catch the trade winds in your sails. Explore, Dream, Discover. â€“Mark Twain"},{"data":"Life is 10% what happens to me and 90% of how I react to it. â€“Charles Swindoll"},{"data":"The most common way people give up their power is by thinking they donâ€™t have any. â€“Alice Walker"},{"data":"The mind is everything. What you think you become. â€“Buddha"},{"data":"The best time to plant a tree was 20 years ago. The second best time is now. â€“Chinese Proverb"},{"data":"An unexamined life is not worth living. â€“Socrates"},{"data":"Eighty percent of success is showing up. â€“Woody Allen"},{"data":"Your time is limited, so donâ€™t waste it living someone elseâ€™s life. â€“Steve Jobs"},{"data":"Winning isnâ€™t everything, but wanting to win is. â€“Vince Lombardi"},{"data":"I am not a product of my circumstances. I am a product of my decisions. â€“Stephen Covey"},{"data":"Every child is an artist. The problem is how to remain an artist once he grows up. â€“Pablo Picasso"},{"data":"You can never cross the ocean until you have the courage to lose sight of the shore. â€“Christopher Columbus"},{"data":"Iâ€™ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel. â€“Maya Angelou"},{"data":"Either you run the day, or the day runs you. â€“Jim Rohn"},{"data":"Whether you think you can or you think you canâ€™t, youâ€™re right. â€“Henry Ford"},{"data":"The two most important days in your life are the day you are born and the day you find out why. â€“Mark Twain"},{"data":"Whatever you can do, or dream you can, begin it. Boldness has genius, power and magic in it. â€“Johann Wolfgang von Goethe"},{"data":"The best revenge is massive success. â€“Frank Sinatra"},{"data":"People often say that motivation doesnâ€™t last. Well, neither does bathing. Thatâ€™s why we recommend it daily. â€“Zig Ziglar"},{"data":"Life shrinks or expands in proportion to one\'s courage. â€“Anais Nin"},{"data":"There is only one way to avoid criticism: do nothing, say nothing, and be nothing. â€“Aristotle"},{"data":"Ask and it will be given to you; search, and you will find; knock and the door will be opened for you. â€“Jesus"},{"data":"The only person you are destined to become is the person you decide to be. â€“Ralph Waldo Emerson"},{"data":"Go confidently in the direction of your dreams. Live the life you have imagined. â€“Henry David Thoreau"},{"data":"When I stand before God at the end of my life, I would hope that I would not have a single bit of talent left and could say, I used everything you gave me. â€“Erma Bombeck"},{"data":"Few things can help an individual more than to place responsibility on him, and to let him know that you trust him. â€“Booker T. Washington"},{"data":"Certain things catch your eye, but pursue only those that capture the heart. â€“ Ancient Indian Proverb"}]'.replace(
            /â€™/g,
            "&rsquo;"
        )
    );

    var quotes = [];
    quotesRaw.forEach(function (quote) {
        quote = quote.data.split(/ â€“|-/);
        var c = quote[0];
        var a = quote[1];
        quotes.push({
            content: c,
            author: a
        });
    });

    return quotes;
}
