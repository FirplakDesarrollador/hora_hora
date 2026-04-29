-- =============================================
-- Tabla: Hora_Hora
-- Almacena las evaluaciones Hora-Hora completas
-- =============================================

create table public."Hora_Hora" (
  id uuid primary key default gen_random_uuid(),
  consecutivo serial not null,
  fecha date not null default current_date,
  turno text not null default '',
  planta text not null default '',
  linea text not null default '',
  puesto text not null default '',
  supervisor text not null default '',
  operario text not null default '',
  creado_por text not null default '',
  creado_por_email text not null default '',

  -- Tiempos
  tiempo_ciclo_teorico numeric not null default 0,
  tiempo_inicio bigint not null default 0,
  tiempo_fin bigint,
  tiempo_total numeric not null default 0,
  ciclos_totales integer not null default 0,
  tiempo_promedio numeric not null default 0,

  -- Rendimiento
  piezas_teoricas integer not null default 0,
  piezas_reales integer not null default 0,
  rendimiento numeric not null default 0,

  -- Calidad
  piezas_totales_calidad integer not null default 0,
  piezas_buenas integer not null default 0,
  piezas_defectuosas integer not null default 0,
  calidad numeric not null default 0,

  -- HDT
  hdt_cumple boolean default null,
  hdt_comentario text not null default '',

  -- Desperdicios y observaciones
  desperdicios text[] not null default '{}',
  comentario_general text not null default '',
  firma_operario text not null default '',

  -- Estado
  estado_global text not null default 'Pendiente',

  -- Ciclos individuales (JSON array)
  ciclos jsonb not null default '[]'::jsonb,

  -- Metadata
  created_at timestamp with time zone not null default now(),
  updated_at timestamp with time zone not null default now()
);

-- Índices para los filtros más comunes
create index idx_hora_hora_planta on public."Hora_Hora" (planta);
create index idx_hora_hora_creado_por_email on public."Hora_Hora" (creado_por_email);
create index idx_hora_hora_fecha on public."Hora_Hora" (fecha);
create index idx_hora_hora_created_at on public."Hora_Hora" (created_at desc);

-- RLS (Row Level Security)
alter table public."Hora_Hora" enable row level security;

-- Política: Todos los usuarios autenticados pueden leer
create policy "Usuarios autenticados pueden leer"
  on public."Hora_Hora" for select
  to authenticated
  using (true);

-- Política: Usuarios autenticados pueden insertar
create policy "Usuarios autenticados pueden insertar"
  on public."Hora_Hora" for insert
  to authenticated
  with check (true);

-- Política: Solo el creador puede actualizar
create policy "Solo el creador puede actualizar"
  on public."Hora_Hora" for update
  to authenticated
  using (creado_por_email = (select auth.jwt() ->> 'email'));

-- Política: Solo el creador puede eliminar
create policy "Solo el creador puede eliminar"
  on public."Hora_Hora" for delete
  to authenticated
  using (creado_por_email = (select auth.jwt() ->> 'email'));

-- Comentario de tabla
comment on table public."Hora_Hora" is 'Evaluaciones Hora-Hora de producción - FIRPLAK';
