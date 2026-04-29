# Hora-Hora FIRPLAK

Aplicación para el seguimiento y evaluación de tiempos de ciclo, calidad y desperdicios Lean (Hora-Hora) en las plantas de producción de FIRPLAK.

## Características

- **Evaluación en Tiempo Real**: Medición de ciclos con cronómetro integrado o registro manual.
- **KPIs Automáticos**: Cálculo instantáneo de Rendimiento %, Calidad % y Cumplimiento HDT.
- **Análisis de Desperdicios**: Identificación de los 7+1 desperdicios de Lean Manufacturing.
- **Histórico**: Consulta de evaluaciones pasadas almacenadas en Supabase.
- **Estadísticas**: Dashboard interactivo con filtros por Planta, Supervisor y Fecha.
- **Integración Corporativa**: Resolución de nombres de operarios y supervisores desde la base de datos central de FIRPLAK.

## Tecnologías

- **Framework**: Next.js 14 (App Router)
- **Lenguaje**: TypeScript
- **Estilos**: Tailwind CSS + Shadcn UI
- **Estado**: Zustand
- **Base de Datos**: Supabase (PostgreSQL)

## Configuración

Asegúrate de configurar las variables de entorno en un archivo `.env.local`:

```env
NEXT_PUBLIC_SUPABASE_URL=tu_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=tu_anon_key
NEXT_PUBLIC_EXTERNAL_SUPABASE_URL=url_externa
NEXT_PUBLIC_EXTERNAL_SUPABASE_ANON_KEY=key_externa
```

## Desarrollo

```bash
npm install
npm run dev
```
