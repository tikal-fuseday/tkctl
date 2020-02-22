module.exports = {
  title: 'tkctl',
  description: 'tkctl - a wrapper cli for configurations',
  dest: './dist',
  plugins: [
    'flowchart'
  ],
  head: [
    ['link', { rel: 'icon', href: 'logo.png' }],
    ['link', { rel: 'manifest', href: '/manifest.json' }],
    ['meta', { name: 'theme-color', content: '#f5c077' }],
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    ['meta', { name: 'apple-mobile-web-app-status-bar-style', content: 'black' }],
    ['link', { rel: 'apple-touch-icon', href: '/icons/apple-touch-icon-152x152.png' }],
    ['link', { rel: 'apple-touch-icon', href: '/icons/apple-touch-icon-120x120.png' }],
    ['link', { rel: 'apple-touch-icon', href: '/icons/apple-touch-icon-76x76.png' }],
    ['link', { rel: 'apple-touch-icon', href: '/icons/apple-touch-icon-60x60.png' }],
    ['meta', { name: 'msapplication-TileImage', content: '/icons/msapplication-icon-144x144.png' }],
    ['meta', { name: 'msapplication-TileColor', content: '#000000' }],
  ],
  themeConfig: {
    nav: [
      { text: 'About', link: '/about/introduction' },
      { text: 'Guides', link: '/guides/getting-started' },
      { text: 'Reference', link: '/reference/configuration-variables' },
      { text: 'Tips', link: '/tips/' },
      { text: 'GitHub', link: 'https://github.com/tikal-fuseday/tkctl' }
    ],
    sidebar: {
      '/about/': getAboutSidebar(),
      '/guides/': getGuidesSidebar(),
      '/reference/': getReferenceSidebar(),
      '/tips/': getTipsSidebar()
    }
  }
}

function getAboutSidebar () {
  return [
    'introduction',
    'roadmap',
    'contributing',
    'license',
    'contact'
  ] 
}

function getGuidesSidebar () {
  return [
    'getting-started'
  ]
}

function getReferenceSidebar () {
  return [
    'configuration-variables'
  ]
}

function getTipsSidebar () {
  return [
    ''
  ]
}
