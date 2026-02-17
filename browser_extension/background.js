// PyIDM Pro - Browser extension: send link URL to local app via HTTP POST
const API_URL = 'http://127.0.0.1:47652/add';

chrome.contextMenus.create({
  id: 'pyidm-send',
  title: 'Download with PyIDM Pro',
  contexts: ['link']
});

chrome.contextMenus.onClicked.addListener((info, tab) => {
  const url = info.linkUrl;
  if (!url || !url.startsWith('http')) return;
  fetch(API_URL, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ url })
  }).catch(() => {});
});
