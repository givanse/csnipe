/**
 * 
 * Verify that your manifest file is served with the correct mime type:
 *     curl -I http://localhost/your-site/some-folder/manifest.appcache
 * Look for:
 *     Content-Type: text/cache-manifest
 *
 * Application cache API:
 *     http://msdn.microsoft.com/en-us/library/windows/apps/hh465686.aspx
 *
 * Good resources:
 *     http://appcachefacts.info/  
 * 
 */

var cacheStatusValues = [];
cacheStatusValues[0] = 'uncached';/* appcache object is not fully initialized */
cacheStatusValues[1] = 'idle';     /* appcache is not currently being updated */
cacheStatusValues[2] = 'checking';    /* fetch and check manifest for updates */
cacheStatusValues[3] = 'downloading';  /* new resources found and being added */
cacheStatusValues[4] = 'updateready';       /* new appcache version available */
cacheStatusValues[5] = 'obsolete';          /* appcache group is now obsolete */

var appCache = window.applicationCache;
appCache.addEventListener('cached', logEvent, false);
appCache.addEventListener('checking', logEvent, false);
appCache.addEventListener('downloading', logEvent, false);
appCache.addEventListener('error', logEvent, false);
appCache.addEventListener('noupdate', logEvent, false);
appCache.addEventListener('obsolete', logEvent, false);
appCache.addEventListener('progress', logEvent, false);
appCache.addEventListener('updateready', logEvent, false);

/**
 * If you suspect that there is a syntax error in your manifest, check:
 *     http://www.w3.org/TR/html5/browsers.html#manifests 
 */
function logEvent(e) {
    var online, status, message;
    online = (navigator.onLine) ? 'yes' : 'no';
    var eventType = e.type;

    message = 'App {online: ' + online + '} ';
    message += 'Appcache {event: ' + eventType;
    message += ', status: ' + cacheStatusValues[appCache.status] + '} ';

    if (eventType == 'error' && navigator.onLine) {
        message += '(possible syntax errors in the manifest)';
    }

    console.log(message);
}

/** 
 * Attempt to update user's cache.
 * The manifest file must have changed. 
 */ 
function updateUserCache() {
    console.log('attempting to update appache');
    window.applicationCache.update(); 
}

/* Triggered if the user's cache has been updated. */ 
window.applicationCache.addEventListener(
    'updateready', 
    function() {
        var appCache = window.applicationCache;

        if(appCache.status === appCache.UPDATEREADY) {
            /* Change the old cache for the new one. */
            appCache.swapCache();
            console.log('swap cache has been called');

            if (confirm('A new version of this site is available. Load it?')) {
                window.location.reload();
            }
        }
    }, 
    false
);

window.applicationCache.addEventListener(
    'error', 
    function(e) {
        /* It is enough to find one 400 or 500 error for the whole thing to fail. */
        console.log(window.applicationCache);
    }, 
    false
);
    
setInterval(updateUserCache, 10000);

/* EOF */
