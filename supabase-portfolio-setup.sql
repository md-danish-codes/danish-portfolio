-- Portfolio direct-upload setup — run ONCE in Supabase SQL Editor
-- Project: lateral-gang (same project, new table + bucket for the portfolio)

-- 1) Storage bucket for certificate files (public read)
insert into storage.buckets (id, name, public)
values ('portfolio-files', 'portfolio-files', true)
on conflict (id) do nothing;

-- 2) Metadata table
create table if not exists public.portfolio_certificates (
  id bigint generated always as identity primary key,
  title text not null,
  issuer text not null,
  cert_date date,
  file_url text not null,
  file_path text not null,
  created_at timestamptz not null default now()
);

alter table public.portfolio_certificates enable row level security;

create policy "cert public read"   on public.portfolio_certificates for select using (true);
create policy "cert public insert" on public.portfolio_certificates for insert with check (true);
create policy "cert public delete" on public.portfolio_certificates for delete using (true);

-- 3) Storage policies for the bucket
create policy "pf public read"   on storage.objects for select using (bucket_id = 'portfolio-files');
create policy "pf public insert" on storage.objects for insert with check (bucket_id = 'portfolio-files');
create policy "pf public delete" on storage.objects for delete using (bucket_id = 'portfolio-files');
create policy "pf public update" on storage.objects for update using (bucket_id = 'portfolio-files');
