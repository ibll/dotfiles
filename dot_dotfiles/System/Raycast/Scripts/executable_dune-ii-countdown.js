#!/usr/bin/env node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title Dune Part II
// @raycast.mode inline
// @raycast.refreshTime 1h

// Optional parameters:
// @raycast.icon /Users/isbell/.dotfiles/System/Raycast/Scripts/Images/dune_ii_logo.png
// @raycast.packageName Dune II Countdown

// Documentation:
// @raycast.author Chloe Isbell
// @raycast.authorURL https://github.com/TheGoodDude22

const RELEASE_DATE = "2023-11-03"

function toDate(dateStr) {
    const parts = dateStr.split("-").map(x => Number(x))
    return new Date(parts[0], parts[1] - 1, parts[2])
  }

function fetchDaysUntil(target) {
    const today = new Date()
    if (today > target) {
        target.setFullYear(today.getFullYear() + 1)
    } else {
        target.setFullYear(today.getFullYear())
    }
    return Math.floor((Number(target) - Number(today)) / (1000*60*60*24)) + 1
}

const daysUntilRelease = fetchDaysUntil(toDate(RELEASE_DATE));
console.log(`releases in ${daysUntilRelease} days!`)