const AdminJS = require('adminjs')
const AdminJSExpress = require('@adminjs/express')
const { DMMFClass } = require('@prisma/client/runtime')

const express = require('express')
const router = require('./routes/route')
const AdminJSPrisma = require('@adminjs/prisma')
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

const temp = prisma._baseDmmf

const dmmf = new DMMFClass(temp)


AdminJS.registerAdapter({
  Resource: AdminJSPrisma.Resource,
  Database: AdminJSPrisma.Database,
})

const PORT = 4000




const start = async () => {
  const app = express()
  const adminOptions = {
    resources: [{
      resource: { model: prisma.user, client: prisma },
      options: {},
    }],
    resources: [{
      resource: { model: prisma.movie, client: prisma },
      options: {},
    }],
    resources: [{
      resource: { model: prisma.cart, client: prisma },
      options: {},
    }],
    resources: [{
      resource: { model: prisma.orderHistory, client: prisma },
      options: {},
    }],
    resources: [{
      resource: { model: prisma.order, client: prisma },
      options: {},
    }],
  
  }

  const admin = new AdminJS(adminOptions)

  const adminRouter = AdminJSExpress.buildRouter(admin)
  app.use(admin.options.rootPath, adminRouter)
  app.use('/api/v1/movie',router)

  app.listen(PORT, () => {
    console.log(`Application started on http://localhost:${PORT}`)
  })
}

start()