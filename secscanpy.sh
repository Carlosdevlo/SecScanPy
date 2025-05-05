#!/bin/bash

# SecScanPy - Herramienta de Escaneo de Seguridad
# Versión Personalizada para Carlos Carrillo
# Licencia: MIT

VERSION="1.2.0-dev"
AUTHOR="Carlos Carrillo"
CONFIG_DIR="$HOME/.config/secscanpy"
LOG_DIR="$CONFIG_DIR/logs"
CONFIG_FILE="$CONFIG_DIR/config.conf"
TEMP_FILE="/tmp/secscanpy_temp_$(date +%s).txt"

# Colores para la interfaz
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Inicializar configuración
init_config() {
    if [ ! -d "$CONFIG_DIR" ]; then
        mkdir -p "$CONFIG_DIR" "$LOG_DIR"
        echo -e "${GREEN}[+]${NC} Directorio de configuración creado: $CONFIG_DIR"
        
        cat > "$CONFIG_FILE" <<EOL
# Configuración de SecScanPy
DEFAULT_SCAN_TYPE='quick'
LOG_LEVEL='info'
MAX_PORTS=100
HTTP_TIMEOUT=5
SHOW_BANNER=true
EOL
    fi
}

# Mostrar banner personalizado
show_banner() {
    clear
    echo -e "${MAGENTA}"
    echo "  ███████ ███████  ██████ ███████ ██████ ██   ██ ██████ "
    echo " ██      ██      ██      ██      ██   ██ ██  ██  ██   ██"
    echo " ███████ ███████ ██      █████   ██████  █████   ██████ "
    echo "      ██      ██ ██      ██      ██   ██ ██  ██  ██   ██"
    echo " ███████ ███████  ██████ ███████ ██   ██ ██   ██ ██   ██"
    echo -e "${NC}"
    echo -e "${BLUE}Security Scanner Tool${NC} | ${YELLOW}v$VERSION${NC} | by ${GREEN}$AUTHOR${NC}"
    echo -e "${RED}USE ONLY ON AUTHORIZED SYSTEMS${NC}"
    echo -e "========================================"
    echo
}
#Mostrar características
show_features() {
    echo -e "${CYAN}Características disponibles:${NC}"
    echo -e "  ${GREEN}⟫${NC} Escaneo de puertos automatizado"
    echo -e "  ${GREEN}⟫${NC} Detección de servicios vulnerables"
    echo -e "  ${GREEN}⟫${NC} Análisis de cabeceras HTTP"
    echo -e "  ${GREEN}⟫${NC} Búsqueda de CVE conocidos"
    echo -e "  ${YELLOW}⟫${NC} Generación de reportes PDF (próximamente)"
    echo -e "  ${YELLOW}⟫${NC} Interfaz CLI y API REST (próximamente)"
    echo
}

# Mostrar stack tecnológico
show_tech_stack() {
    echo -e "${CYAN}Tecnologías utilizadas:${NC}"
    echo -e "  ${GREEN}⟫${NC} Bash scripting"
    echo -e "  ${GREEN}⟫${NC} Nmap"
    echo -e "  ${GREEN}⟫${NC} cURL"
    echo -e "  ${GREEN}⟫${NC} GNU Core Utilities"
    echo -e "  ${YELLOW}⟫${NC} Python 3 (próximamente)"
    echo -e "  ${YELLOW}⟫${NC} Flask (próximamente)"
    echo
}

# Escaneo de puertos con visualización en terminal
port_scan() {
    local target=$1
    local ports=$2
    local scan_type=$3
    
    echo -e "${BLUE}[*]${NC} Iniciando escaneo ${CYAN}$scan_type${NC} en ${GREEN}$target${NC}"
    
    if [ "$scan_type" == "quick" ]; then
        nmap -T4 --top-ports $MAX_PORTS "$target" | tee "$TEMP_FILE"
    elif [ "$scan_type" == "full" ]; then
        nmap -T4 -p- "$target" | tee "$TEMP_FILE"
    else
        nmap -T4 -p "$ports" "$target" | tee "$TEMP_FILE"
    fi
    
    echo -e "${GREEN}[+]${NC} Escaneo completado"
    analyze_results "$TEMP_FILE"
}

# Detección de servicios
service_detection() {
    local target=$1
    
    echo -e "${BLUE}[*]${NC} Detectando servicios en ${GREEN}$target${NC}"
    nmap -sV -T4 "$target" | tee "$TEMP_FILE"
    
    echo -e "${GREEN}[+]${NC} Detección de servicios completada"
    analyze_results "$TEMP_FILE"
}

# Análisis de cabeceras HTTP
http_header_analysis() {
    local target=$1
    
    echo -e "${BLUE}[*]${NC} Analizando cabeceras HTTP en ${GREEN}$target${NC}"
    
    if [[ "$target" != http* ]]; then
        target="http://$target"
    fi
    
    echo -e "${CYAN}Resultados:${NC}"
    curl -I "$target" 2>/dev/null | while read -r line; do
        if [[ "$line" == *"Server:"* ]]; then
            echo -e "  ${YELLOW}Servidor web:${NC} ${line#*:}"
        elif [[ "$line" == *"X-Powered-By:"* ]]; then
            echo -e "  ${YELLOW}Tecnología:${NC} ${line#*:}"
        elif [[ "$line" == *"HTTP/"* ]]; then
            echo -e "  ${YELLOW}Versión HTTP:${NC} ${line#*HTTP/}"
        fi
    done
    
    echo -e "${GREEN}[+]${NC} Análisis de cabeceras completado"
}

# Búsqueda de CVEs
cve_lookup() {
    local target=$1
    
    echo -e "${BLUE}[*]${NC} Buscando CVEs conocidos para servicios en ${GREEN}$target${NC}"
    
    if ! command -v vulners >/dev/null 2>&1; then
        echo -e "${YELLOW}[!]${NC} Script vulners de Nmap no encontrado"
        echo -e "  Instala con: sudo nmap --script-updatedb"
        return
    fi
    
    nmap -sV --script vulners "$target" | grep -E "CVE-[0-9]{4}-[0-9]+" | sort | uniq | tee "$TEMP_FILE"
    
    if [ ! -s "$TEMP_FILE" ]; then
        echo -e "${YELLOW}[!]${NC} No se encontraron CVEs conocidos"
    else
        echo -e "${GREEN}[+]${NC} Búsqueda de CVEs completada"
    fi
}

# Analizar resultados
analyze_results() {
    local file=$1
    
    echo -e "\n${CYAN}Análisis de resultados:${NC}"
    
    # Puertos abiertos
    open_ports=$(grep -E '^[0-9]+/.*open' "$file" | awk '{print $1}' | cut -d'/' -f1 | tr '\n' ',' | sed 's/,$//')
    if [ -n "$open_ports" ]; then
        echo -e "  ${GREEN}Puertos abiertos:${NC} $open_ports"
    else
        echo -e "  ${RED}No se encontraron puertos abiertos${NC}"
    fi
    
    # Servicios detectados
    services=$(grep -E '^[0-9]+/.*open' "$file" | awk '{for(i=4;i<=NF;i++) printf $i" "; print ""}' | sort | uniq)
    if [ -n "$services" ]; then
        echo -e "  ${GREEN}Servicios detectados:${NC}"
        echo "$services" | while read -r service; do
            echo -e "    - $service"
        done
    fi
}

# Escaneo completo
full_scan() {
    local target=$1
    local ports=$2
    local scan_type=${3:-quick}
    
    show_banner
    
    echo -e "${MAGENTA}Iniciando escaneo de seguridad completo${NC}"
    echo -e "Objetivo: ${GREEN}$target${NC}"
    echo -e "Hora de inicio: $(date)"
    echo -e "================================================"
    
    # Ejecutar todas las funciones de escaneo
    port_scan "$target" "$ports" "$scan_type"
    echo
    service_detection "$target"
    echo
    http_header_analysis "$target"
    echo
    cve_lookup "$target"
    
    echo -e "\n${MAGENTA}================================================"
    echo -e "Escaneo completado"
    echo -e "Hora de finalización: $(date)"
    echo -e "================================================${NC}"
    
    rm -f "$TEMP_FILE"
}

# Menú principal
main_menu() {
    while true; do
        echo -e "\n${CYAN}Menú Principal - SecScanPy${NC}"
        echo -e "1. Escaneo rápido (top 100 puertos)"
        echo -e "2. Escaneo completo (todos los puertos)"
        echo -e "3. Escaneo personalizado (puertos específicos)"
        echo -e "4. Análisis de servicios"
        echo -e "5. Análisis de cabeceras HTTP"
        echo -e "6. Búsqueda de CVEs"
        echo -e "7. Mostrar características"
        echo -e "8. Mostrar tecnologías"
        echo -e "9. Salir"
        
        read -p "Seleccione una opción (1-9): " choice
        
        case $choice in
            1)
                read -p "Ingrese el objetivo (IP/hostname): " target
                full_scan "$target" "" "quick"
                ;;
            2)
                read -p "Ingrese el objetivo (IP/hostname): " target
                full_scan "$target" "" "full"
                ;;
            3)
                read -p "Ingrese el objetivo (IP/hostname): " target
                read -p "Ingrese los puertos a escanear (ej. 80,443,1000-2000): " ports
                full_scan "$target" "$ports" "custom"
                ;;
            4)
                read -p "Ingrese el objetivo (IP/hostname): " target
                service_detection "$target"
                ;;
            5)
                read -p "Ingrese el objetivo (IP/hostname): " target
                http_header_analysis "$target"
                ;;
            6)
                read -p "Ingrese el objetivo (IP/hostname): " target
                cve_lookup "$target"
                ;;
            7)
                show_features
                ;;
            8)
                show_tech_stack
                ;;
            9)
                echo -e "${GREEN}Saliendo de SecScanPy...${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Opción no válida. Intente nuevamente.${NC}"
                ;;
        esac
    done
}

# Inicio del programa
init_config
show_banner

if [ $# -eq 0 ]; then
    main_menu
else
    case $1 in
        scan)
            if [ $# -lt 2 ]; then
                echo -e "${RED}Error: Debe especificar un objetivo${NC}"
                exit 1
            fi
            
            target=$2
            shift 2
            ports=""
            scan_type="quick"
            
            while [ $# -gt 0 ]; do
                case $1 in
                    --quick)
                        scan_type="quick"
                        ;;
                    --full)
                        scan_type="full"
                        ;;
                    --ports)
                        ports=$2
                        scan_type="custom"
                        shift
                        ;;
                    *)
                        echo -e "${RED}Opción no reconocida: $1${NC}"
                        exit 1
                        ;;
                esac
                shift
            done
            
            full_scan "$target" "$ports" "$scan_type"
            ;;
        --features)
            show_features
            ;;
        --tech)
            show_tech_stack
            ;;
        --help)
            echo -e "${CYAN}Uso:${NC}"
            echo -e "  $0 scan <objetivo> [--quick|--full|--ports <puertos>]"
            echo -e "  $0 --features"
            echo -e "  $0 --tech"
            echo -e "  $0 --help"
            echo -e "  $0 (sin argumentos para menú interactivo)"
            ;;
        *)
            echo -e "${RED}Comando no reconocido: $1${NC}"
            exit 1
            ;;
    esac
fi
