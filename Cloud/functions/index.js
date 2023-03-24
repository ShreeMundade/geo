const functions = require("firebase-functions");
const admin = require("firebase-admin");
const firebase = require('firebase-admin');
// const express = require('express');
// const engines = require('consolidate');
// const Vision = require('@google-cloud/vision');
// const levenshtein = require('js-levenshtein');
// const restName = require('./restName');
// const parser = require('./parser');
// const jsonQuery = require('json-query')
const sendNotification = async (token, payload) => {
  try {
    const response = await admin.messaging().sendToDevice(token, payload);
    console.log(`Successfully sent message: ${response}`);
    return true;
  } catch (error) {
    console.log(`Error sending message: ${error}`);
    return false;
  }
}

exports.sendNotification = functions.database.ref("leaves/{uid}/{key}").onUpdate(async (change, context) => {
  const before = change.before;
  const after = change.after;
  console.log(context.params.uid);
  const request = after.val();
  const payload = {
    notification: {
      title: "Update on your Leave Status",
      body: `Your Leave has been ${request.status}.`
    },
    data: {
      sound: "default",
      click_action: "FLUTTER_NOTIFICATION_CLICK"
    }
  };
  if (request.withdrawalStatus === 0) {
    const tokenSnapshot = await admin.database().ref(`users/${context.params.uid}/notificationToken`).once("value");
    const token = tokenSnapshot.val();
    if (token) {
      console.log(`Token ID: ${token}`);
      await sendNotification(token, payload);
    } else {
      console.log("No token available");
    }
  }
});
