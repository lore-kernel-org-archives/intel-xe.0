Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B32C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 14:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356DC10EC15;
	Tue,  8 Sep 2026 14:15:52 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E243610EC15;
 Tue,  8 Sep 2026 14:15:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4748721624120926813=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/sysctrl=3A_Clean_up?=
 =?utf-8?q?_error_handling_in_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 14:15:50 -0000
Message-ID: <178887695091.134370.16506020240830885429@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
In-Reply-To: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============4748721624120926813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sysctrl: Clean up error handling in (rev5)
URL   : https://patchwork.freedesktop.org/series/172513/
State : success

== Summary ==

CI Bug Log - changes from xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e_FULL -> xe-pw-172513v5_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-172513v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - shard-lnl:          [PASS][1] -> [SKIP][2] ([Intel XE#2134]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@fbdev@info.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@fbdev@info.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#3432])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_color@ctm-0-75:
    - shard-lnl:          [PASS][9] -> [SKIP][10] ([Intel XE#3297])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_color@ctm-0-75.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_color@ctm-0-75.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d:
    - shard-lnl:          [PASS][11] -> [SKIP][12] ([Intel XE#7006])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d-lut1d.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#8265])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][16] -> [SKIP][17] ([Intel XE#8680]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-lnl:          [PASS][18] -> [SKIP][19] ([Intel XE#1135] / [Intel XE#6128])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_feature_discovery@psr2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#301]) +2 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-lnl:          [PASS][22] -> [SKIP][23] ([Intel XE#2482]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip@plain-flip-ts-check.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7178] / [Intel XE#7351])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-lnl:          [PASS][26] -> [SKIP][27] ([Intel XE#1745] / [Intel XE#9144])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-lnl:          [PASS][28] -> [SKIP][29] ([Intel XE#9144])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4141]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2352] / [Intel XE#7399])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2311]) +18 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7061])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:
    - shard-lnl:          [PASS][34] -> [SKIP][35] ([Intel XE#7779]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-lnl:          [PASS][36] -> [SKIP][37] ([Intel XE#2548] / [Intel XE#7779]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2313]) +18 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-lnl:          [PASS][39] -> [SKIP][40] ([Intel XE#2568]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_invalid_mode@uint-max-clock.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6911] / [Intel XE#7466])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2486])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7283])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [PASS][44] -> [SKIP][45] ([Intel XE#9125]) +26 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plane_cursor@primary.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#5021] / [Intel XE#7377])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
    - shard-lnl:          [PASS][47] -> [SKIP][48] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b:
    - shard-lnl:          [PASS][49] -> [SKIP][50] ([Intel XE#2763] / [Intel XE#6886]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2763] / [Intel XE#6886]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1489]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#4608])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#4608] / [Intel XE#7304])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr2-dpms@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_psr@fbc-psr2-dpms@edp-1.html

  * igt@kms_psr@psr-no-drrs:
    - shard-lnl:          [PASS][56] -> [SKIP][57] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr@psr-no-drrs.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2330] / [Intel XE#5813])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [PASS][60] -> [SKIP][61] ([Intel XE#1435] / [Intel XE#9142])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_setmode@basic.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_setmode@basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1499]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#6599])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][64] -> [INCOMPLETE][65] ([Intel XE#6321] / [Intel XE#8355])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [PASS][67] -> [FAIL][68] ([Intel XE#8578])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8374]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#8364]) +12 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#9096])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#8378]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          [PASS][74] -> [ABORT][75] ([Intel XE#8007]) +1 other test abort
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#6964])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#7793]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1420] / [Intel XE#7590])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-lnl:          [SKIP][79] ([Intel XE#2134]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@fbdev@unaligned-write.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@fbdev@unaligned-write.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][81] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_color@ctm-green-to-red:
    - shard-lnl:          [SKIP][83] ([Intel XE#3297]) -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_color@ctm-green-to-red.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_color@ctm-green-to-red.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d:
    - shard-lnl:          [SKIP][85] ([Intel XE#7006]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_feature_discovery@psr1:
    - shard-lnl:          [SKIP][87] ([Intel XE#1135]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_feature_discovery@psr1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [SKIP][89] ([Intel XE#2482]) -> [PASS][90] +3 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][91] ([Intel XE#301]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][93] ([Intel XE#7779]) -> [PASS][94] +2 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-lnl:          [SKIP][95] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][96] +10 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-lnl:          [SKIP][97] ([Intel XE#2568]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_invalid_mode@int-max-clock.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-lnl:          [SKIP][99] ([Intel XE#7250] / [Intel XE#9128]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-lnl:          [SKIP][101] ([Intel XE#9128]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane@plane-panning-top-left.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-lnl:          [SKIP][103] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-lnl:          [SKIP][105] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][106] +3 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-lnl:          [SKIP][107] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][108] +3 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-lnl:          [SKIP][109] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-lnl:          [SKIP][111] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][112] +3 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@fbc-psr-sprite-render.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_setmode@basic-no-cpu-idle:
    - shard-lnl:          [SKIP][113] ([Intel XE#9142]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_setmode@basic-no-cpu-idle.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_setmode@basic-no-cpu-idle.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          [SKIP][115] ([Intel XE#9125]) -> [PASS][116] +21 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_vblank@query-forked.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_vblank@query-forked.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [FAIL][117] ([Intel XE#9096]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-4/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [ABORT][119] ([Intel XE#8007]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [SKIP][145], [PASS][146]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-10/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-10/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-1/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-4/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-7/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-4/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-7/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-1/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-10/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-1/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-10/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-10/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-7/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-9/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-9/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-9/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-6/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-6/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-6/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-3/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-3/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-3/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-5/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][172] ([Intel XE#9125]) -> [SKIP][173] ([Intel XE#1407]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][174] ([Intel XE#1407]) -> [SKIP][175] ([Intel XE#9125])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [SKIP][176] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][177] ([Intel XE#9125])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][178] ([Intel XE#9125]) -> [SKIP][179] ([Intel XE#1124]) +5 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-lnl:          [SKIP][180] ([Intel XE#1124]) -> [SKIP][181] ([Intel XE#9125]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][182] ([Intel XE#367]) -> [SKIP][183] ([Intel XE#9125])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][184] ([Intel XE#9125]) -> [SKIP][185] ([Intel XE#8365])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][186] ([Intel XE#9125]) -> [SKIP][187] ([Intel XE#2887]) +7 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][188] ([Intel XE#9125]) -> [SKIP][189] ([Intel XE#3432])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          [SKIP][190] ([Intel XE#3432]) -> [SKIP][191] ([Intel XE#9125])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][192] ([Intel XE#2887]) -> [SKIP][193] ([Intel XE#9125]) +7 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          [SKIP][194] ([Intel XE#7008]) -> [SKIP][195] ([Intel XE#9125])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          [SKIP][196] ([Intel XE#7642]) -> [SKIP][197] ([Intel XE#9125]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_content_protection@atomic-dpms.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          [SKIP][198] ([Intel XE#6974]) -> [SKIP][199] ([Intel XE#9125])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][200] ([Intel XE#9125]) -> [SKIP][201] ([Intel XE#307] / [Intel XE#6974])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-lnl:          [SKIP][202] ([Intel XE#9125]) -> [SKIP][203] ([Intel XE#7642])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_content_protection@uevent-hdcp14.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          [SKIP][204] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][205] ([Intel XE#9125])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-lnl:          [SKIP][206] ([Intel XE#9125]) -> [SKIP][207] ([Intel XE#1424]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_crc@cursor-random-64x21.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          [SKIP][208] ([Intel XE#9125]) -> [SKIP][209] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          [SKIP][210] ([Intel XE#1424]) -> [SKIP][211] ([Intel XE#9125]) +3 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-lnl:          [SKIP][212] ([Intel XE#9125]) -> [SKIP][213] ([Intel XE#309] / [Intel XE#7343])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-lnl:          [SKIP][214] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][215] ([Intel XE#9125])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          [SKIP][216] ([Intel XE#9125]) -> [SKIP][217] ([Intel XE#323] / [Intel XE#6035])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][218] ([Intel XE#4302]) -> [SKIP][219] ([Intel XE#9125])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_display_modes@extended-mode-basic.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-lnl:          [SKIP][220] ([Intel XE#9125]) -> [SKIP][221] ([Intel XE#9009])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          [SKIP][222] ([Intel XE#9125]) -> [SKIP][223] ([Intel XE#8265]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-lnl:          [SKIP][224] ([Intel XE#8265]) -> [SKIP][225] ([Intel XE#9125]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][226] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][227] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          [SKIP][228] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][229] ([Intel XE#2548] / [Intel XE#7779]) +6 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][230] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][231] ([Intel XE#6312] / [Intel XE#651]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][232] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][233] ([Intel XE#2548] / [Intel XE#7779]) +18 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][234] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][235] ([Intel XE#656] / [Intel XE#7905]) +21 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][236] ([Intel XE#7779]) -> [SKIP][237] ([Intel XE#6312]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          [SKIP][238] ([Intel XE#6312]) -> [SKIP][239] ([Intel XE#7779]) +7 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][240] ([Intel XE#7779]) -> [SKIP][241] ([Intel XE#7061]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          [SKIP][242] ([Intel XE#7779]) -> [SKIP][243] ([Intel XE#7399])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          [SKIP][244] ([Intel XE#7779]) -> [SKIP][245] ([Intel XE#7865]) +11 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-lnl:          [SKIP][246] ([Intel XE#7865]) -> [SKIP][247] ([Intel XE#7779]) +13 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][248] ([Intel XE#7905]) -> [SKIP][249] ([Intel XE#7779]) +22 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][250] ([Intel XE#7061]) -> [SKIP][251] ([Intel XE#7779]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][252] ([Intel XE#7779]) -> [SKIP][253] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-lnl:          [SKIP][254] ([Intel XE#7779]) -> [SKIP][255] ([Intel XE#7905]) +20 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][256] ([Intel XE#9125]) -> [SKIP][257] ([Intel XE#3374] / [Intel XE#3544])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_hdr@brightness-with-hdr.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][258] ([Intel XE#1503]) -> [SKIP][259] ([Intel XE#9125])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-lnl:          [SKIP][260] ([Intel XE#9125]) -> [SKIP][261] ([Intel XE#4596] / [Intel XE#5854])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-4.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          [SKIP][262] ([Intel XE#4596] / [Intel XE#5854]) -> [SKIP][263] ([Intel XE#9125])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plane_multiple@2x-tiling-y.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][264] ([Intel XE#9125]) -> [SKIP][265] ([Intel XE#5020] / [Intel XE#7348])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          [SKIP][266] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][267] ([Intel XE#7343] / [Intel XE#7687] / [Intel XE#9125])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-lnl:          [SKIP][268] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][269] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][270] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][271] ([Intel XE#1489]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][272] ([Intel XE#1489]) -> [SKIP][273] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][274] ([Intel XE#1489]) -> [SKIP][275] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          [SKIP][276] ([Intel XE#1128] / [Intel XE#7413]) -> [SKIP][277] ([Intel XE#1122] / [Intel XE#7429])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          [SKIP][278] ([Intel XE#1122] / [Intel XE#7429]) -> [SKIP][279] ([Intel XE#1128] / [Intel XE#7413])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-lnl:          [SKIP][280] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][281] ([Intel XE#1406])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-blt.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          [SKIP][282] ([Intel XE#1406]) -> [SKIP][283] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          [SKIP][284] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][285] ([Intel XE#1406] / [Intel XE#7345])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][286] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][287] ([Intel XE#9125]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][288] ([Intel XE#9125]) -> [SKIP][289] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-90.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][290] ([Intel XE#9125]) -> [SKIP][291] ([Intel XE#1127] / [Intel XE#5813])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][292] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][293] ([Intel XE#2426] / [Intel XE#5848])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][294] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][295] ([Intel XE#2509] / [Intel XE#7437])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [ABORT][296] ([Intel XE#8591] / [Intel XE#8963]) -> [DMESG-WARN][297] ([Intel XE#8963])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_wedged@basic-wedged.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e -> xe-pw-172513v5

  IGT_9085: 9085
  xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e: 06602b51786b6c2a0f97e58f0e0f168be1ada27e
  xe-pw-172513v5: 172513v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/index.html

--===============4748721624120926813==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe/sysctrl: Clean up error handling in (=
rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/172513/">https://patchwork.freedesktop.org/series/172513/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-172513v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-172513v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5704-06602b51786b6c2a0f97e58f0e0f168be=
1ada27e_FULL -&gt; xe-pw-172513v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172513v5_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@fbdev@in=
fo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-172513v5/shard-lnl-6/igt@fbdev@info.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@kms_bw@linear-tiling-4-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_chamelium_edid@hdmi-mode-=
timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_colo=
r@ctm-0-75.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_color@ctm-0-75.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel=
 XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_colo=
r_pipeline@plane-lut1d-lut1d.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_color_pipeli=
ne@plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_content_protection@suspen=
d-resume@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_dsc@dsc-basic-ultrajoiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_fbco=
n_fbt@psr-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8680">Intel XE#8680</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_feat=
ure_discovery@psr2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_feature_discovery@psr2=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1135">Intel XE#1135</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip=
@plain-flip-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_flip@plain-flip-ts-c=
heck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2482">Intel XE#2482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE=
#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7385">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9144">Intel XE#9144</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-l=
nl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_flip=
_scaled_crc@flip-p010-4tile-to-p016-4tile.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms=
_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/sh=
ard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7779">Intel XE#7779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/ig=
t@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE=
#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7779">Intel XE#7779</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_inva=
lid_mode@uint-max-clock.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_invalid_mode@uint=
-max-clock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2568">Intel XE#2568</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_plane@pixel-format-y-tile=
d-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plan=
e_cursor@primary.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_plane_cursor@primary.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9125">Intel XE#9125</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plan=
e_scaling@plane-scaler-unity-scaling-with-modifiers.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl=
-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763=
">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6886">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plan=
e_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/sh=
ard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@p=
ipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-e=
dp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel X=
E#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_psr@fbc-psr2-dpms@edp-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr@=
psr-no-drrs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_psr@psr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@kms_psr@psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_setm=
ode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_setmode@basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel X=
E#1435</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@xe_compute@ccs-mode-compute-k=
ernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-5/igt@xe_evict@evic=
t-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_exec_=
fault_mode@atomic-many.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-6/igt@xe_exec_fault_mode@ato=
mic-many.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/ig=
t@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9=
096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_exec_threads@threads-multi=
-queue-mixed-fd-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-1/igt@xe_fault=
_injection@inject-fault-probe-function-xe_pm_init_early.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard=
-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@xe_multigpu_svm@mgpu-pagefaul=
t-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_page_reclaim@basic-mixed.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@fbdev@un=
aligned-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@fbdev@unaligned-w=
rite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#=
8150</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
172513v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_colo=
r@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_color@ct=
m-green-to-red.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_colo=
r_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@k=
ms_color_pipeline@plane-ctm3x4-lut1d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_feature_=
discovery@psr1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip=
@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_fl=
ip@basic-flip-vs-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE=
#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172513v5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shr=
fb-draw-mmap-wc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel X=
E#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172513v5/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multid=
raw.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_inva=
lid_mode@int-max-clock.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_inva=
lid_mode@int-max-clock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Int=
el XE#9128</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-172513v5/shard-lnl-8/igt@kms_plane@pixel-format-x-tiled-modifier-sour=
ce-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e@plane-panning-top-left.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_pl=
ane@plane-panning-top-left.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e_scaling@invalid-num-scalers.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel X=
E#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172513v5/shard-lnl-8/igt@kms_plane_scaling@invalid-num-scalers.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
86">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_plane=
_scaling@plane-scaler-with-clipping-clamping-rotation.html">PASS</a> +3 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/68=
86">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_plane_scaling@plane-upscale-20x20=
-with-pixel-format@pipe-a.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#83=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172=
513v5/shard-lnl-1/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@=
fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/i=
gt@kms_psr@fbc-psr-sprite-render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-no-cpu-idle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_setm=
ode@basic-no-cpu-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_setmo=
de@basic-no-cpu-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_vbla=
nk@query-forked.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_vblank@quer=
y-forked.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5=
/shard-lnl-4/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1725=
13v5/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepa=
re.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-10/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/s=
hard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada2=
7e/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1=
ada27e/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f16=
8be1ada27e/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e=
0f168be1ada27e/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e=
58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0=
f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6=
c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b517=
86b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602=
b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-0=
6602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-57=
04-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e=
/shard-bmg-10/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1a=
da27e/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172513v5/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-172513v5/shard-bmg-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shar=
d-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-10/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-172513v5/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-172513v5/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-172513v5/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-172513v5/shard-bmg-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/sh=
ard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-172513v5/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-172513v5/shard-bmg-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-172513v5/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-172513v5/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-5/igt@xe_module_load@l=
oad.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_=
fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_=
big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5=
/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_big_=
fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel =
XE#7085</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-172513v5/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-=
hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_=
fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_b=
ig_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@km=
s_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_bw@l=
inear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-l=
nl-6/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_bw@l=
inear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard=
-lnl-1/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Inte=
l XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@=
ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-=
8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-ln=
l-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3=
432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_ccs@=
crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/ig=
t@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)=
 +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7008">Intel XE#7008</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@k=
ms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_cont=
ent_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/sha=
rd-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">=
Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@km=
s_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cont=
ent_protection@uevent-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@km=
s_content_protection@uevent-hdcp14.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_curs=
or_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/s=
hard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_curs=
or_crc@cursor-random-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_=
cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_curs=
or_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms=
_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel =
XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/s=
hard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE=
#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/=
shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
323">Intel XE#323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@k=
ms_display_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dp_l=
inktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-ln=
l-8/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009">Intel XE#9=
009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dsc@=
dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/ig=
t@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_dsc@=
dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/sh=
ard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125=
">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel X=
E#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9144">Intel XE#9144</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel=
 XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9144">Intel XE#9144</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE=
#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-pr=
imscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/79=
05">Intel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-prim=
scrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +18 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn=
-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +21 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE=
#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172513v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6312">Intel XE#6312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#=
6312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-sp=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7779">Intel XE#7779</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#777=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172=
513v5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-=
mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-=
1/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#777=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172=
513v5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7865">Intel XE#7865</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/=
igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)=
 +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#=
7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
172513v5/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7779">Intel XE#7779</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/s=
hard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
79">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/s=
hard-lnl-1/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
61">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1725=
13v5/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7905">Intel XE#7905</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-=
6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_plane_=
multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shar=
d-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687"=
>Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886=
">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20-=
downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125"=
>Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_psr2=
_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel=
 XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-172513v5/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-contin=
uous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1725=
13v5/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2=
_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-l=
nl-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE=
#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-ln=
l-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7=
429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-=
8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@=
fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-8/igt@k=
ms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr@=
fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_p=
sr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@=
fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@kms_p=
sr@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_rota=
tion_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342"=
>Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-172513v5/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect=
-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl-1/igt@km=
s_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">In=
tel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-lnl=
-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#112=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813=
">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shar=
d-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172513v5/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_wedge=
d@basic-wedged.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8591">Intel XE#8591</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v5/shard-bmg-2/igt@x=
e_wedged@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e -&gt; xe-pw-172=
513v5</li>
</ul>
<p>IGT_9085: 9085<br />
  xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e: 06602b51786b6c2a0f97e58=
f0e0f168be1ada27e<br />
  xe-pw-172513v5: 172513v5</p>

</body>
</html>

--===============4748721624120926813==--
