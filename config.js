// Your Supabase project details.
// Supabase dashboard → Project Settings → API Keys (URL is under Project Settings → Data API, or on the project home page).
//
// Use the PUBLISHABLE key (starts with "sb_publishable_"), or on older projects the "anon public" key.
// Both are designed to be public: row-level security in supabase-setup.sql is what keeps each board private.
// NEVER put the secret / service_role key here.
window.BOARD_CONFIG = {
  supabaseUrl: "https://YOUR-PROJECT-REF.supabase.co",
  supabaseKey: "PASTE-YOUR-PUBLISHABLE-KEY-HERE",
};
