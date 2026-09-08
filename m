Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8911C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 12:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFB610EBC9;
	Tue,  8 Sep 2026 12:47:30 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9394B10E0E8;
 Tue,  8 Sep 2026 12:47:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8958819498172443568=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Add_wa=5F1402594?=
 =?utf-8?q?1587_to_xe2=2C_xe3_and_xe3p_platforms_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 12:47:29 -0000
Message-ID: <178887164959.134370.3693835949875283848@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908083656.51704-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260908083656.51704-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============8958819498172443568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms (rev6)
URL   : https://patchwork.freedesktop.org/series/167706/
State : failure

== Summary ==

CI Bug Log - changes from xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e_FULL -> xe-pw-167706v6_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167706v6_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167706v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167706v6_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-7/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-2/igt@xe_pm@d3hot-basic-exec.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-5/igt@xe_pm@d3hot-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-167706v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - shard-lnl:          [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@fbdev@write.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@fbdev@write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#3279])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1407]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#3432])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2887])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_color@ctm-0-75:
    - shard-lnl:          [PASS][16] -> [SKIP][17] ([Intel XE#3297])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_color@ctm-0-75.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_color@ctm-0-75.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d:
    - shard-lnl:          [PASS][18] -> [SKIP][19] ([Intel XE#7006])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d-lut1d.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_content_protection@suspend-resume.html
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#7642])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#309] / [Intel XE#7343])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#8265])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#8265])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][25] -> [SKIP][26] ([Intel XE#8680]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-lnl:          [PASS][27] -> [SKIP][28] ([Intel XE#1135] / [Intel XE#6128])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_feature_discovery@psr2.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1421])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-lnl:          [PASS][30] -> [SKIP][31] ([Intel XE#2482]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip@plain-flip-ts-check.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7178] / [Intel XE#7351])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-lnl:          [PASS][34] -> [SKIP][35] ([Intel XE#1745] / [Intel XE#9144])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-lnl:          [PASS][36] -> [SKIP][37] ([Intel XE#9144])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#6312]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4141]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-lnl:          [PASS][41] -> [SKIP][42] ([Intel XE#2548] / [Intel XE#7779]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1469] / [Intel XE#7399])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2352] / [Intel XE#7399])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2311]) +9 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7905]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7061])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7061])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [PASS][50] -> [SKIP][51] ([Intel XE#7779]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2313]) +12 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7865]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-lnl:          [PASS][54] -> [SKIP][55] ([Intel XE#2568]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_invalid_mode@uint-max-clock.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2486])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [PASS][57] -> [SKIP][58] ([Intel XE#9125]) +26 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plane_cursor@primary.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#5021] / [Intel XE#7377])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#4596] / [Intel XE#5854])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-lnl:          [PASS][61] -> [SKIP][62] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:
    - shard-lnl:          [PASS][65] -> [SKIP][66] ([Intel XE#2763] / [Intel XE#6886]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1489]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#4608])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#4608] / [Intel XE#7304])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-dpms@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr@fbc-psr2-dpms@edp-1.html

  * igt@kms_psr@psr-no-drrs:
    - shard-lnl:          [PASS][72] -> [SKIP][73] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr@psr-no-drrs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [PASS][75] -> [SKIP][76] ([Intel XE#1435] / [Intel XE#9142])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_setmode@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_setmode@basic.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1499])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@kms_vrr@flipline.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][78] -> [INCOMPLETE][79] ([Intel XE#6321] / [Intel XE#8355])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#6540] / [Intel XE#688])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7482])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_exec_balancer@no-exec-cm-virtual-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2322] / [Intel XE#7372])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1392])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#8374])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#8364]) +8 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#8364]) +6 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#8378])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#8378])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#6964])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#7793])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_page_reclaim@basic-mixed.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7793])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#1420] / [Intel XE#7590])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_sriov_flr@flr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#7569])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_sriov_flr@flr-basic.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-lnl:          [SKIP][95] ([Intel XE#2134]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@fbdev@unaligned-write.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@fbdev@unaligned-write.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][97] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_color@ctm-signed:
    - shard-lnl:          [SKIP][99] ([Intel XE#3297]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_color@ctm-signed.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_color@ctm-signed.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d:
    - shard-lnl:          [SKIP][101] ([Intel XE#7006]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_feature_discovery@psr1:
    - shard-lnl:          [SKIP][103] ([Intel XE#1135]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_feature_discovery@psr1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-lnl:          [SKIP][105] ([Intel XE#2482]) -> [PASS][106] +3 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip@absolute-wf_vblank.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][107] ([Intel XE#7779]) -> [PASS][108] +2 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-lnl:          [SKIP][109] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][110] +10 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-lnl:          [SKIP][111] ([Intel XE#2568]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_invalid_mode@int-max-clock.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-lnl:          [SKIP][113] ([Intel XE#7250] / [Intel XE#9128]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-lnl:          [SKIP][115] ([Intel XE#9128]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane@plane-panning-top-left.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-lnl:          [SKIP][117] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-lnl:          [SKIP][119] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][120] +3 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-lnl:          [SKIP][121] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][122] +3 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-lnl:          [SKIP][123] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-lnl:          [SKIP][125] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][126] +3 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@fbc-psr-sprite-render.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_setmode@basic-no-cpu-idle:
    - shard-lnl:          [SKIP][127] ([Intel XE#9142]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_setmode@basic-no-cpu-idle.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_setmode@basic-no-cpu-idle.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          [SKIP][129] ([Intel XE#9125]) -> [PASS][130] +21 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_vblank@query-forked.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_vblank@query-forked.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [FAIL][131] ([Intel XE#9096]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [ABORT][133] ([Intel XE#8007]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][135] ([Intel XE#9125]) -> [SKIP][136] ([Intel XE#1407]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][137] ([Intel XE#1407]) -> [SKIP][138] ([Intel XE#9125])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [SKIP][139] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][140] ([Intel XE#9125])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][141] ([Intel XE#9125]) -> [SKIP][142] ([Intel XE#1124]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][143] ([Intel XE#1124]) -> [SKIP][144] ([Intel XE#9125]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][145] ([Intel XE#367]) -> [SKIP][146] ([Intel XE#9125])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][147] ([Intel XE#9125]) -> [SKIP][148] ([Intel XE#8365])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          [SKIP][149] ([Intel XE#9125]) -> [SKIP][150] ([Intel XE#2887]) +7 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][151] ([Intel XE#2887]) -> [SKIP][152] ([Intel XE#9125]) +7 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][153] ([Intel XE#9125]) -> [SKIP][154] ([Intel XE#3432])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          [SKIP][155] ([Intel XE#3432]) -> [SKIP][156] ([Intel XE#9125])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          [SKIP][157] ([Intel XE#7008]) -> [SKIP][158] ([Intel XE#9125])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          [SKIP][159] ([Intel XE#7642]) -> [SKIP][160] ([Intel XE#9125]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_content_protection@atomic-dpms.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          [SKIP][161] ([Intel XE#6974]) -> [SKIP][162] ([Intel XE#9125])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][163] ([Intel XE#9125]) -> [SKIP][164] ([Intel XE#307] / [Intel XE#6974])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-lnl:          [SKIP][165] ([Intel XE#9125]) -> [SKIP][166] ([Intel XE#7642])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_content_protection@uevent-hdcp14.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-lnl:          [SKIP][167] ([Intel XE#1424]) -> [SKIP][168] ([Intel XE#9125]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          [SKIP][169] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][170] ([Intel XE#9125])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-lnl:          [SKIP][171] ([Intel XE#9125]) -> [SKIP][172] ([Intel XE#1424]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          [SKIP][173] ([Intel XE#9125]) -> [SKIP][174] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-lnl:          [SKIP][175] ([Intel XE#9125]) -> [SKIP][176] ([Intel XE#309] / [Intel XE#7343])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-lnl:          [SKIP][177] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][178] ([Intel XE#9125])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          [SKIP][179] ([Intel XE#9125]) -> [SKIP][180] ([Intel XE#323] / [Intel XE#6035])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][181] ([Intel XE#4302]) -> [SKIP][182] ([Intel XE#9125])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_display_modes@extended-mode-basic.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-lnl:          [SKIP][183] ([Intel XE#9125]) -> [SKIP][184] ([Intel XE#9009])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-lnl:          [SKIP][185] ([Intel XE#8265]) -> [SKIP][186] ([Intel XE#9125]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          [SKIP][187] ([Intel XE#9125]) -> [SKIP][188] ([Intel XE#8265]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][189] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][190] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][191] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][192] ([Intel XE#6312] / [Intel XE#651]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][193] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][194] ([Intel XE#656] / [Intel XE#7905]) +21 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][195] ([Intel XE#7779]) -> [SKIP][196] ([Intel XE#6312]) +5 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][197] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][198] ([Intel XE#2548] / [Intel XE#7779]) +6 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-lnl:          [SKIP][199] ([Intel XE#7779]) -> [SKIP][200] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          [SKIP][201] ([Intel XE#6312]) -> [SKIP][202] ([Intel XE#7779]) +7 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          [SKIP][203] ([Intel XE#7779]) -> [SKIP][204] ([Intel XE#7399])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          [SKIP][205] ([Intel XE#7865]) -> [SKIP][206] ([Intel XE#7779]) +13 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          [SKIP][207] ([Intel XE#7779]) -> [SKIP][208] ([Intel XE#7865]) +11 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][209] ([Intel XE#7779]) -> [SKIP][210] ([Intel XE#7061]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][211] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][212] ([Intel XE#2548] / [Intel XE#7779]) +18 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][213] ([Intel XE#7779]) -> [SKIP][214] ([Intel XE#7905]) +20 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][215] ([Intel XE#7905]) -> [SKIP][216] ([Intel XE#7779]) +22 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][217] ([Intel XE#7061]) -> [SKIP][218] ([Intel XE#7779]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][219] ([Intel XE#9125]) -> [SKIP][220] ([Intel XE#3374] / [Intel XE#3544])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_hdr@brightness-with-hdr.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][221] ([Intel XE#1503]) -> [SKIP][222] ([Intel XE#9125])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-lnl:          [SKIP][223] ([Intel XE#9125]) -> [SKIP][224] ([Intel XE#4596] / [Intel XE#5854])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-4.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          [SKIP][225] ([Intel XE#4596] / [Intel XE#5854]) -> [SKIP][226] ([Intel XE#9125])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plane_multiple@2x-tiling-y.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][227] ([Intel XE#9125]) -> [SKIP][228] ([Intel XE#5020] / [Intel XE#7348])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          [SKIP][229] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][230] ([Intel XE#7343] / [Intel XE#7687] / [Intel XE#9125])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-lnl:          [SKIP][231] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][232] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][233] ([Intel XE#1489]) -> [SKIP][234] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][235] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][236] ([Intel XE#1489]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][237] ([Intel XE#1489]) -> [SKIP][238] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          [SKIP][239] ([Intel XE#1128] / [Intel XE#7413]) -> [SKIP][240] ([Intel XE#1122] / [Intel XE#7429])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          [SKIP][241] ([Intel XE#1122] / [Intel XE#7429]) -> [SKIP][242] ([Intel XE#1128] / [Intel XE#7413])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          [SKIP][243] ([Intel XE#1406]) -> [SKIP][244] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-lnl:          [SKIP][245] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][246] ([Intel XE#1406])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          [SKIP][247] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][248] ([Intel XE#1406] / [Intel XE#7345])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][249] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][250] ([Intel XE#9125]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][251] ([Intel XE#9125]) -> [SKIP][252] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-90.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][253] ([Intel XE#9125]) -> [SKIP][254] ([Intel XE#1127] / [Intel XE#5813])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][255] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][256] ([Intel XE#2426] / [Intel XE#5848])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][257] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][258] ([Intel XE#2509] / [Intel XE#7437])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [ABORT][259] ([Intel XE#8963]) -> [DMESG-WARN][260] ([Intel XE#8963])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@xe_wedged@basic-wedged.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_wedged@basic-wedged.html
    - shard-bmg:          [ABORT][261] ([Intel XE#8591] / [Intel XE#8963]) -> [DMESG-WARN][262] ([Intel XE#8963])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_wedged@basic-wedged.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
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
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
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
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569
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

  * Linux: xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e -> xe-pw-167706v6

  IGT_9085: 9085
  xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e: 06602b51786b6c2a0f97e58f0e0f168be1ada27e
  xe-pw-167706v6: 167706v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/index.html

--===============8958819498172443568==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167706/">https://patchwork.freedesktop.org/series/167706/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e_FULL -&gt; xe-pw-167706v6_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167706v6_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-167706v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167706v6_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-7/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-2/igt@xe_pm@d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-5/igt@xe_pm@d3hot-basic-exec.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167706v6_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_color@ctm-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d-lut1d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_flip@plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_invalid_mode@uint-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plane_cursor@primary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr@fbc-psr2-dpms@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr@psr-no-drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_setmode@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_exec_balancer@no-exec-cm-virtual-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_sriov_flr@flr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569">Intel XE#7569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_color@ctm-signed.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_feature_discovery@psr1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip@absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_flip@absolute-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_invalid_mode@int-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_invalid_mode@int-max-clock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane@plane-panning-top-left.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane_scaling@invalid-num-scalers.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr@fbc-psr-sprite-render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-no-cpu-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_setmode@basic-no-cpu-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_setmode@basic-no-cpu-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_vblank@query-forked.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_vblank@query-forked.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008">Intel XE#7008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-7/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-lnl-1/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-lnl-3/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e/shard-bmg-2/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591">Intel XE#8591</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v6/shard-bmg-10/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e -&gt; xe-pw-167706v6</li>
</ul>
<p>IGT_9085: 9085<br />
  xe-5704-06602b51786b6c2a0f97e58f0e0f168be1ada27e: 06602b51786b6c2a0f97e58f0e0f168be1ada27e<br />
  xe-pw-167706v6: 167706v6</p>

</body>
</html>

--===============8958819498172443568==--
