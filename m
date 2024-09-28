Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27231CF6493
	for <intel-xe@archiver.kernel.org>; Sat, 28 Sep 2024 07:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C7C10E146;
	Sat, 28 Sep 2024 07:14:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056A510E13D;
 Sat, 28 Sep 2024 07:14:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1712372933313912784=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=5Fsubmit=3A_improve_?=
 =?utf-8?q?schedule_disable_error_logging?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 28 Sep 2024 07:14:03 -0000
Message-ID: <172750764300.1131067.4310172939251845860@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927133535.548793-2-matthew.auld@intel.com>
In-Reply-To: <20240927133535.548793-2-matthew.auld@intel.com>
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

--===============1712372933313912784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc_submit: improve schedule disable error logging
URL   : https://patchwork.freedesktop.org/series/139211/
State : failure

== Summary ==

CI Bug Log - changes from xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b_full -> xe-pw-139211v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139211v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139211v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139211v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][1] +9 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     [SKIP][6] ([Intel XE#1201]) -> [SKIP][7] +21 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_psr@psr2-primary-render.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_psr@psr2-primary-render.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_joiner@invalid-modeset:
    - {shard-bmg}:        NOTRUN -> [SKIP][8] +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-bmg-3/igt@kms_big_joiner@invalid-modeset.html

  
Known issues
------------

  Here are the changes found in xe-pw-139211v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#324])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2191])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1512]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1399]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#314])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#373]) +6 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#599]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1424]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#309]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-lnl:          [PASS][28] -> [DMESG-WARN][29] ([Intel XE#877]) +1 other test dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-1/igt@kms_cursor_legacy@torture-move@pipe-a.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-7/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#886]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1397] / [Intel XE#1745])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1397])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1401] / [Intel XE#1745])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1401])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][37] -> [FAIL][38] ([Intel XE#1874]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#352])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#651]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#656]) +13 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#656]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#653])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [PASS][48] -> [DMESG-WARN][49] ([Intel XE#324]) +2 other tests dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][50] -> [FAIL][51] ([Intel XE#616]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2763]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][53] ([Intel XE#1195] / [Intel XE#2566])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][54] ([Intel XE#1195])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [FAIL][56] ([Intel XE#1649]) +7 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1406]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#2850]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1437])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#455])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1447])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#688]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1392]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#2229])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#2541])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#584])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][70] -> [ABORT][71] ([Intel XE#1794])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#944])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#944])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][74] ([Intel XE#1033]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][76] ([Intel XE#1659]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][78] ([Intel XE#1195]) -> [PASS][79] +2 other tests pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [DMESG-WARN][80] ([Intel XE#877]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-lnl:          [FAIL][82] ([Intel XE#886]) -> [PASS][83] +2 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-adlp:         [FAIL][84] -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][86] ([Intel XE#1874]) -> [PASS][87] +3 other tests pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][88] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][90] ([Intel XE#2622]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane@pixel-format@pipe-a-plane-0:
    - shard-lnl:          [FAIL][92] -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-8/igt@kms_plane@pixel-format@pipe-a-plane-0.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-5/igt@kms_plane@pixel-format@pipe-a-plane-0.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][94] ([Intel XE#324]) -> [PASS][95] +2 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-3/igt@kms_plane@plane-position-hole.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][96] ([Intel XE#324]) -> [PASS][97] +4 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][98] -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_sequence@queue-busy:
    - shard-lnl:          [FAIL][100] ([Intel XE#2467]) -> [PASS][101] +2 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-5/igt@kms_sequence@queue-busy.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-5/igt@kms_sequence@queue-busy.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][102] ([Intel XE#1473]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind:
    - shard-lnl:          [DMESG-WARN][104] -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-7/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - {shard-bmg}:        [FAIL][106] -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-bmg-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-bmg-5/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [TIMEOUT][108] ([Intel XE#2105]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-FAIL][110] ([Intel XE#1620]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - {shard-bmg}:        [INCOMPLETE][112] -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_oa@mmio-triggered-reports:
    - {shard-bmg}:        [DMESG-WARN][114] ([Intel XE#877]) -> [PASS][115] +8 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-WARN][116] -> [PASS][117] +4 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][118] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][120] ([Intel XE#1794]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][122] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][124] ([Intel XE#324]) -> [DMESG-WARN][125] ([Intel XE#1033] / [Intel XE#324])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#316]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][129] ([Intel XE#316]) +6 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][130] ([Intel XE#1231]) -> [FAIL][131] ([Intel XE#1242])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][132] ([Intel XE#324]) -> [FAIL][133] ([Intel XE#1231])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][135] ([Intel XE#1124]) +9 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#619]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#619])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][139] ([Intel XE#607])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][141] ([Intel XE#610])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1124]) -> [SKIP][143] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][145] ([Intel XE#367]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#2191]) -> [SKIP][147] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#367]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#1252]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#1252]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#787]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][155] ([Intel XE#1252]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][157] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][159] ([Intel XE#787]) +83 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#314]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#314])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][165] ([Intel XE#306])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#306]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#306])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#373]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][171] ([Intel XE#373]) +9 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#307]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#307])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][175] ([Intel XE#307])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][177] ([Intel XE#308]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#308]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#308])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#323]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#323])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#455]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][185] ([Intel XE#701])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][187] ([Intel XE#455]) +16 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][189] ([Intel XE#651]) +30 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#651]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#658]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#658])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][195] ([Intel XE#653]) +28 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#653]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#653]) +23 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#356]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#356])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][200] ([Intel XE#324]) -> [DMESG-WARN][201] ([Intel XE#324])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-3/igt@kms_plane@plane-position-covered.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-3/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#2763]) -> [SKIP][203] ([Intel XE#2763]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) -> [SKIP][205] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][207] ([Intel XE#870])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][208] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][209] ([Intel XE#1204])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#2850]) -> [SKIP][211] ([Intel XE#2850]) +13 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#2850]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#2850]) +11 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][215] ([Intel XE#327]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][217] ([Intel XE#1127])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#327]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#756]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#756])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#2849]) -> [SKIP][223] ([Intel XE#2849])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][226] -> [SKIP][227] ([Intel XE#1201]) +10 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#288]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#288]) +16 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][231] ([Intel XE#288]) +20 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][233] ([Intel XE#512])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@xe_mmap@small-bar.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2541]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_oa@missing-sample-flags.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][237] ([Intel XE#2541]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@xe_oa@privileged-forked-access-vaddr.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1337]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#1337])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][241] ([Intel XE#979])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][243] ([Intel XE#366])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#366]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#366])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][247] ([Intel XE#944]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#944]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@xe_query@multigpu-query-topology.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
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
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b -> xe-pw-139211v1

  IGT_8035: 54cf84790112f2656b38b9068d4b492fbef13d84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b: 4d4fdd11d1cc941f2f7c1653fc07519851d9052b
  xe-pw-139211v1: 139211v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/index.html

--===============1712372933313912784==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc_submit: improve schedule disable error logging</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139211/">https://patchwork.freedesktop.org/series/139211/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b_full -&gt; xe-pw-139211v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139211v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139211v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139211v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@psr2-primary-render:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_psr@psr2-primary-render.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_big_joiner@invalid-modeset:<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-bmg-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139211v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-1/igt@kms_cursor_legacy@torture-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-7/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-8/igt@kms_plane@pixel-format@pipe-a-plane-0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-5/igt@kms_plane@pixel-format@pipe-a-plane-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-3/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_plane@plane-position-hole.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-5/igt@kms_sequence@queue-busy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2467">Intel XE#2467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-5/igt@kms_sequence@queue-busy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-7/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-bmg-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-bmg-5/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-bmg-8/igt@xe_oa@mmio-triggered-reports.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-4/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-lnl-3/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-lnl-3/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139211v1/shard-dg2-434/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b -&gt; xe-pw-139211v1</li>
</ul>
<p>IGT_8035: 54cf84790112f2656b38b9068d4b492fbef13d84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b: 4d4fdd11d1cc941f2f7c1653fc07519851d9052b<br />
  xe-pw-139211v1: 139211v1</p>

</body>
</html>

--===============1712372933313912784==--
