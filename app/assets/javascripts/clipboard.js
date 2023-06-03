document.addEventListener('DOMContentLoaded', () => {
    var clipboard = new ClipboardJS('.btn-copy');

    clipboard.on('success', function(e) {
        console.info('Text:', e.text);
        alert('Copied!');
        e.clearSelection();
    });

    clipboard.on('error', function(e) {
        console.error('Action:', e.action);
        console.error('Trigger:', e.trigger);
    });
})