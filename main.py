from database import db
from fastapi import FastAPI


def init_app():
    db.init()

    app = FastAPI(
        title="Users App",
        description="Handling Our User",
        version="1",
    )

    @app.on_event("startup")
    async def startup():
        await db.create_all()

    @app.on_event("shutdown")
    async def shutdown():
        await db.close()

    from views import api

    app.include_router(
        api,
        prefix="/api/v1",
    )

    return app


app = init_app()
