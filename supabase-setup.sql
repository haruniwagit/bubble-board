-- Bubble Board: database setup.
-- Paste this whole file into Supabase → SQL Editor → New query, then press Run. Safe to run more than once.

-- One row per person, holding their whole board as JSON.
create table if not exists public.boards (
  user_id    uuid primary key references auth.users (id) on delete cascade,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

-- Row-level security: every query only ever sees the signed-in person's own row.
alter table public.boards enable row level security;

drop policy if exists "read own board"   on public.boards;
drop policy if exists "create own board" on public.boards;
drop policy if exists "update own board" on public.boards;
drop policy if exists "delete own board" on public.boards;

create policy "read own board"   on public.boards for select to authenticated using ((select auth.uid()) = user_id);
create policy "create own board" on public.boards for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "update own board" on public.boards for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "delete own board" on public.boards for delete to authenticated using ((select auth.uid()) = user_id);

grant select, insert, update, delete on public.boards to authenticated;

-- Live sync between your devices.
do $$
begin
  alter publication supabase_realtime add table public.boards;
exception when duplicate_object then null;
end $$;
