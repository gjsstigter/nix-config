{ config, pkgs, ... }:

{
  programs.aerospace = {
    enable = false;

    launchd.enable = true;

    userSettings = {                        # ← userSettings, not settings
      start-at-login = true;

      gaps = {
        inner.horizontal = 10;
        inner.vertical   = 10;
        outer.left       = 20;
        outer.bottom     = 20;
        outer.right      = 10;
        outer.top = [{ monitor."built-in" = 10; } 47];
      };

      mode = {
        main = {
          keybinding = "qwerty";
        };
      };

#      enable-normalization-flatten-containers = true;
#      enable-normalization-opposite-orientation-for-nested-containers = true;
#
#      accordion-padding = 30;
#      default-root-container-layout = "tiles";
#      default-root-container-orientation = "auto";
#
#      key-mapping.preset = "qwerty";
#
#      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
#
#      # sketchybar integration
#      exec-on-workspace-change = [
#        "/bin/bash" "-c"
#        "sketchybar --trigger aerospace_workspace_change AEROSPACE_FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE AEROSPACE_PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE"
#      ];
#
#      mode.main.binding = {
#        "alt-slash" = "layout tiles horizontal vertical";
#        "alt-comma" = "layout accordion horizontal vertical";
#
#        "alt-h" = "focus left";
#        "alt-j" = "focus down";
#        "alt-k" = "focus up";
#        "alt-l" = "focus right";
#
#        "alt-shift-h" = "move left";
#        "alt-shift-j" = "move down";
#        "alt-shift-k" = "move up";
#        "alt-shift-l" = "move right";
#
#        "alt-shift-minus" = "resize smart -50";
#        "alt-shift-equal" = "resize smart +50";
#
#        "alt-f"       = "layout floating tiling";
#        "alt-shift-f" = "fullscreen";
#
#        "alt-1" = "workspace 1";
#        "alt-2" = "workspace 2";
#        "alt-3" = "workspace 3";
#        "alt-4" = "workspace 4";
#        "alt-5" = "workspace 5";
#
#        "alt-shift-1" = ["move-node-to-workspace 1" "workspace 1"];
#        "alt-shift-2" = ["move-node-to-workspace 2" "workspace 2"];
#        "alt-shift-3" = ["move-node-to-workspace 3" "workspace 3"];
#        "alt-shift-4" = ["move-node-to-workspace 4" "workspace 4"];
#        "alt-shift-5" = ["move-node-to-workspace 5" "workspace 5"];
#
#        "alt-tab"       = "focus-monitor next";
#        "alt-shift-tab" = "move-node-to-monitor next";
#        "alt-grave"     = "workspace-back-and-forth";
#
#        "alt-shift-semicolon" = "mode service";
#      };
#
#      mode.service.binding = {
#        "esc"     = ["reload-config" "mode main"];
#        "r"       = ["flatten-workspace-tree" "mode main"];
#        "backspace" = ["close-all-windows-but-current" "mode main"];
#      };
    };
  };
}