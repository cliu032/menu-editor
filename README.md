# Menu editor

Daily specials editor for the cafe. One static page: edit today's specials, get suggestions from past menus, and print or export the sheet (A4, N-up, with cut marks).

- Live: https://cliu032.github.io/menu-editor/
- Menu history and settings are stored in the browser that opens the page.

## Shared activity log (optional)

Run once in the Supabase SQL editor to keep a cross-device trace of loads, saves, prints and day changes:

```sql
create table menu_log (
  id bigserial primary key,
  at timestamptz default now(),
  kind text not null,
  detail jsonb,
  device text
);
alter table menu_log enable row level security;
create policy "staff can do everything" on menu_log for all to authenticated using (true) with check (true);
```

Each device also keeps its own log under Settings → Activity log.

## Releasing a change

Run `./stamp.sh` before committing: it writes the same build stamp into `index.html` and `version.txt`. Open tabs poll `version.txt` and reload themselves when a new stamp appears (only when nobody has typed for a minute; the draft is kept in browser storage so nothing is lost).
