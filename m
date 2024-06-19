Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E66C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 16:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF6210E150;
	Wed, 19 Jun 2024 16:11:31 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E8A10E107;
 Wed, 19 Jun 2024 16:11:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8412457071240156478=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/xelpgp=3A_Extend_Wa=5F14?=
 =?utf-8?q?019877138_to_graphics_12=2E74?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jun 2024 16:11:30 -0000
Message-ID: <171881349010.125140.2782820743321356720@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240619065614.131151-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20240619065614.131151-1-sai.teja.pottumuttu@intel.com>
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

--===============8412457071240156478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xelpgp: Extend Wa_14019877138 to graphics 12.74
URL   : https://patchwork.freedesktop.org/series/135046/
State : failure

== Summary ==

CI Bug Log - changes from xe-1494-fcea62a0d6954dcce241d22785597ba416a18076_full -> xe-pw-135046v1_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-135046v1_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135046v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135046v1_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][1] ([Intel XE#1201] / [Intel XE#656]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - {shard-lnl}:        [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][5] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-135046v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#619])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][9] ([Intel XE#1231])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [FAIL][10] ([Intel XE#1874])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#314]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#373])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#308])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][21] -> [DMESG-WARN][22] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-dg2-set2:     [PASS][24] -> [DMESG-WARN][25] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-466/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-adlp:         [PASS][28] -> [SKIP][29] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][31] -> [FAIL][32] ([Intel XE#1874])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#656]) +19 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-adlp:         [PASS][34] -> [SKIP][35] ([Intel XE#1201]) +8 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][39] -> [FAIL][40] ([Intel XE#361])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#870])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1122] / [Intel XE#1201])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#836])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-adlp:         [PASS][48] -> [SKIP][49] ([Intel XE#1201] / [Intel XE#1211])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@kms_pm_rpm@legacy-planes-dpms.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#929])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_psr@psr-suspend.html

  * igt@kms_rmfb@close-fd:
    - shard-dg2-set2:     NOTRUN -> [FAIL][53] ([Intel XE#294]) +2 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_rmfb@close-fd.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#327])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#771] / [Intel XE#899])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][57] -> [FAIL][58] ([Intel XE#899]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#1932])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][64] -> [TIMEOUT][65] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@xe_evict@evict-threads-large.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#688])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:
    - shard-adlp:         [PASS][67] -> [DMESG-WARN][68] ([Intel XE#1214]) +16 other tests dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_basic@twice-userptr-rebind:
    - shard-adlp:         [PASS][70] -> [INCOMPLETE][71] ([Intel XE#1195])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_exec_basic@twice-userptr-rebind.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-2/igt@xe_exec_basic@twice-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#288])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr.html

  * igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][74] ([Intel XE#1962])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_reset@parallel-cat-error:
    - shard-adlp:         [PASS][75] -> [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#358]) +1 other test dmesg-warn
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_exec_reset@parallel-cat-error.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_exec_reset@parallel-cat-error.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#378])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_module_load@force-load.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#1337])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][79] -> [ABORT][80] ([Intel XE#1358])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-6/igt@xe_pm@s4-exec-after.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][81] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][82] +2 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#1201]) -> [PASS][84] +8 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_cdclk@mode-transition.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cdclk@mode-transition.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#1201] / [i915#2575]) -> [PASS][86] +17 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][87] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][88] +3 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - shard-dg2-set2:     [DMESG-WARN][89] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-a.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-464/igt@kms_cursor_legacy@single-move@pipe-a.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg2-set2:     [DMESG-WARN][91] ([Intel XE#282]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_legacy@torture-move.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - {shard-lnl}:        [DMESG-WARN][93] -> [PASS][94] +4 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - {shard-lnl}:        [FAIL][95] ([Intel XE#886]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-adlp:         [DMESG-WARN][97] ([Intel XE#1214]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][99] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][101] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - {shard-lnl}:        [FAIL][103] ([Intel XE#1069]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
    - shard-dg2-set2:     [INCOMPLETE][105] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][108] +24 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:
    - {shard-lnl}:        [DMESG-WARN][109] ([Intel XE#1330] / [Intel XE#1622]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-3/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-8/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][111] ([Intel XE#1794]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][113] ([Intel XE#1601] / [Intel XE#1794]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_vm@mmap-style-bind-userptr-either-side-full:
    - shard-dg2-set2:     [DMESG-FAIL][115] ([Intel XE#1760]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_vm@mmap-style-bind-userptr-either-side-full.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_vm@mmap-style-bind-userptr-either-side-full.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][117] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][118] ([Intel XE#1033] / [Intel XE#1214])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][120] ([Intel XE#316]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-adlp:         [SKIP][121] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][122] ([Intel XE#1201])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#316]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-adlp:         [SKIP][125] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][126] ([Intel XE#1201])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1124]) -> [SKIP][128] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
    - shard-adlp:         [FAIL][129] ([Intel XE#1874]) -> [SKIP][130] ([Intel XE#1201])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][132] ([Intel XE#619])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][133] ([Intel XE#324]) -> [FAIL][134] ([Intel XE#1231]) +2 other tests fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][136] ([Intel XE#1124]) +7 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201]) -> [SKIP][138] ([Intel XE#1124] / [Intel XE#1201])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [i915#2575]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#367])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][142] ([Intel XE#367]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#367]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][146] ([Intel XE#1252])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#787]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#1252])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1252]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#1252])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][155] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][156] ([Intel XE#1201]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][158] ([Intel XE#787]) +69 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][160] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#373]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_chamelium_audio@dp-audio-edid.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][164] ([Intel XE#306]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#306]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#306])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [i915#2575]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][170] ([Intel XE#373]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][171] ([Intel XE#1178]) -> [INCOMPLETE][172] ([Intel XE#1195]) +1 other test incomplete
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-464/igt@kms_content_protection@atomic@pipe-a-dp-4.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][174] ([Intel XE#307])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#308]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-adlp:         [SKIP][177] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][178] ([Intel XE#1201])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][180] ([Intel XE#308]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [DMESG-WARN][181] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][182] ([Intel XE#282]) +5 other tests dmesg-warn
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][183] ([Intel XE#282]) -> [DMESG-WARN][184] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [i915#2575]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#323])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][187] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [DMESG-WARN][188] ([Intel XE#1214] / [Intel XE#282])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_legacy@single-move.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-464/igt@kms_cursor_legacy@single-move.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][189] ([Intel XE#1214] / [Intel XE#1551]) -> [DMESG-WARN][190] ([Intel XE#1551]) +1 other test dmesg-warn
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#455]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [i915#5274]) -> [SKIP][196] ([i915#5274])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][197] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][198] ([Intel XE#1201]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#651]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][202] ([Intel XE#651]) +23 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][203] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][204] ([Intel XE#1201]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][208] ([Intel XE#653]) +20 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-adlp:         [SKIP][209] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][210] ([Intel XE#1201]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#658]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#658])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][214] ([Intel XE#1158])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#653]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-adlp:         [SKIP][221] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#455])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#305]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#870]) -> [SKIP][226] ([Intel XE#1201] / [Intel XE#870])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][228] ([Intel XE#870])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_pm_backlight@fade.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-adlp:         [FAIL][229] ([Intel XE#1203]) -> [SKIP][230] ([Intel XE#1201])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][232] ([Intel XE#929]) +13 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#929]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#929]) +14 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_psr@pr-basic.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_psr@pr-basic.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][238] ([Intel XE#327]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [i915#2575]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#327])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1500]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#1500])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][243] ([Intel XE#1551]) -> [DMESG-WARN][244] ([Intel XE#1214] / [Intel XE#1551]) +1 other test dmesg-warn
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][245] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][246] ([Intel XE#1214])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][247] -> [DMESG-WARN][248] ([Intel XE#1214]) +1 other test dmesg-warn
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][250] ([Intel XE#455]) +11 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_vrr@flipline.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][252] ([Intel XE#756])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][254] ([Intel XE#1091])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][256] ([Intel XE#1126] / [Intel XE#1201])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_exec_fault_mode@twice-basic-imm:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-imm.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-basic-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][260] ([Intel XE#288]) +18 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#288]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][264] ([Intel XE#255])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][266] ([Intel XE#560])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_media_fill@media-fill.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#512])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_mmap@small-bar.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][270] ([Intel XE#977])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][272] ([Intel XE#979])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][274] ([Intel XE#366]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [WARN][275] ([Intel XE#1639]) -> [DMESG-WARN][276] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1727])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-dg2-set2:     [DMESG-WARN][277] ([Intel XE#1551] / [Intel XE#569]) -> [DMESG-WARN][278] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][279] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [DMESG-WARN][280] ([Intel XE#1551] / [Intel XE#569])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][282] ([Intel XE#1214] / [Intel XE#569])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-adlp:         [DMESG-WARN][283] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1941]) -> [DMESG-WARN][284] ([Intel XE#1191] / [Intel XE#1214])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][286] ([Intel XE#944])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#944]) -> [SKIP][288] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1130]) -> [DMESG-FAIL][290] ([Intel XE#1760])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html
    - shard-adlp:         [DMESG-FAIL][291] ([Intel XE#1760]) -> [DMESG-WARN][292] ([Intel XE#1214] / [Intel XE#1760])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1601]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1601
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
  [Intel XE#1639]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#1960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1494-fcea62a0d6954dcce241d22785597ba416a18076 -> xe-pw-135046v1

  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1494-fcea62a0d6954dcce241d22785597ba416a18076: fcea62a0d6954dcce241d22785597ba416a18076
  xe-pw-135046v1: 135046v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/index.html

--===============8412457071240156478==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe/xelpgp: Extend Wa_14019877138 to graphics 12.74</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135046/">https://patchwork.freedesktop.org/series/135046/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1494-fcea62a0d6954dcce241d22785597ba416a18076_full -&gt; xe-pw-135046v1_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-135046v1_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135046v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135046v1_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135046v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-466/igt@kms_cursor_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_rmfb@close-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +16 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_exec_basic@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-2/igt@xe_exec_basic@twice-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_exec_reset@parallel-cat-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_exec_reset@parallel-cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-6/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cdclk@mode-transition.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-464/igt@kms_cursor_legacy@single-move@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_legacy@torture-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-3/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622">Intel XE#1622</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-8/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1601">Intel XE#1601</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-either-side-full:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_vm@mmap-style-bind-userptr-either-side-full.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_vm@mmap-style-bind-userptr-either-side-full.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-464/igt@kms_content_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_content_protection@atomic@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-464/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203">Intel XE#1203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639">Intel XE#1639</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1494-fcea62a0d6954dcce241d22785597ba416a18076 -&gt; xe-pw-135046v1</li>
</ul>
<p>IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1494-fcea62a0d6954dcce241d22785597ba416a18076: fcea62a0d6954dcce241d22785597ba416a18076<br />
  xe-pw-135046v1: 135046v1</p>

</body>
</html>

--===============8412457071240156478==--
