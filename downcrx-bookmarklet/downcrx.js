(function() {
    try {
        var prefix = /^https?\:\/\/chrome\.google\.com\/webstore\/detail\//;
        if (!prefix.test(window.location.toString())) {
            throw new Error('Not a valid chrome extension page url.');
        }
        var crxId = window.location.pathname.split('/')[3];
        var crxUrl = 'https://clients2.google.com/service/update2/crx?response=redirect&x=id%253D' + crxId + '%2526uc';
        window.location =  crxUrl;
    } catch (e) {
        if (confirm('Not a chrome extension page, contact author for help')) {
            document.location  = 'mailto:greatghoul@gmail.com?'
                + 'subject=' + encodeURI('Need help for bookmarklet: downcrx')
                + '&body=' + encodeURI(document.location) + encodeURI('\nError: ' + e.message);
        }
    }
})();void(0);
