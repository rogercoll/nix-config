{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.neck = {
      settings = {
       "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
       "privacy.trackingprotection.enabled" = true;
      };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
      ];
    };
  };

}
