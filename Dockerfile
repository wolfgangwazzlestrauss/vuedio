# Docker instructions to build a deployment Linux container.
#
# For more information, visit https://docs.docker.com/engine/reference/builder.

FROM node:22.2.0-alpine3.19 as build

WORKDIR /repo

COPY . .

RUN npm ci && npm run build

FROM nginxinc/nginx-unprivileged:1.25.5-alpine3.19

COPY --chmod=755 --from=build /repo/dist /usr/share/nginx/html
