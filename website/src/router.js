import Vue from 'vue'
import Router from 'vue-router'

// Page content
import Home from '@/components/Home'
import Notes from '@/components/Notes'
import AddNote from '@/components/AddNote'
import MyNotes from '@/components/MyNotes'
import Contact from '@/components/Contact'
import Signup from '@/components/Signup'

// Fallback page
import PageNotFound from '@/components/PageNotFound'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/notes',
      name: 'Notes',
      component: Notes
    },
    {
      path: '/addnote',
      name: 'AddNote',
      component: AddNote
    },
    {
      path: '/mynotes',
      name: 'MyNotes',
      component: MyNotes
    },
    {
      path: '/contact',
      name: 'Contact',
      component: Contact
    },
    {
      path: '/signup',
      name: 'Signup',
      component: Signup
    },
    {
      path: '**',
      name: 'PageNotFound',
      component: PageNotFound
    }
  ]
})
