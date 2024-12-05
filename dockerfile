# Dockerfile
FROM ubuntu:24.04

# Establece la zona horaria y evita la interacción durante la configuración
ENV DEBIAN_FRONTEND=noninteractive

# Actualiza el sistema y opcionalmente instala paquetes básicos
RUN apt update && apt install -y nala git curl && nala upgrade

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

RUN nala install -y \
  curl git software-properties-common\
  nano neovim python3 htop\
  && apt clean

RUN add-apt-repository ppa:deadsnakes/ppa && nala update && nala install -y python3.13 python3.13-nogil

# Configura un directorio de trabajo
WORKDIR /app

# Comando predeterminado para mantener el contenedor activo
CMD ["bash"]

