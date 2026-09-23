#!/usr/bin/env node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title Dexcom
// @raycast.mode inline
// @raycast.refreshTime 1m

// Optional parameters:
// @raycast.icon ./Images/dexcom_logo.png

// Documentation:
// @raycast.author Chloe Isbell
// @raycast.authorURL https://github.com/ibll

const http = require('https')

const req = http.get('https://bg.ibll.dev/', { timeout: 5000 }, (res) => {
    let data = '';
    res.on('data', chunk => data += chunk);
    res.on('end', () => {
        const lines = data.split('\n')
        const reading = lines[0]
        const trend_line = lines[1]

        if (Number(reading)) {
            const parts = trend_line.trim().split(/\s+/);
            const arrow = parts.length ? parts[parts.length - 1] : '';

            console.log(reading + " " + arrow)

        } else {
            console.log(reading);
        }
    })
})


req.on('timeout', () => {
    console.log('Timed Out');
    req.abort();
})
