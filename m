Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4D3CA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 19:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E7610EBB4;
	Mon, 28 Sep 2026 19:32:19 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3959B10EBA9;
 Mon, 28 Sep 2026 19:32:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5841423155663770246=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/=7Bi915=2Cxe=7D=3A_som?=
 =?utf-8?q?e_suspend/shutdown/resume_unification_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Sep 2026 19:32:18 -0000
Message-ID: <179062393822.215488.11263782894411796728@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1790089118.git.jani.nikula@intel.com>
In-Reply-To: <cover.1790089118.git.jani.nikula@intel.com>
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

--===============5841423155663770246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}: some suspend/shutdown/resume unification (rev3)
URL   : https://patchwork.freedesktop.org/series/174724/
State : failure

== Summary ==

CI Bug Log - changes from xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20_FULL -> xe-pw-174724v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174724v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174724v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174724v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@unload:
    - shard-bmg:          [PASS][1] -> [ABORT][2] +2 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-8/igt@xe_module_load@unload.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-1/igt@xe_module_load@unload.html

  
Known issues
------------

  Here are the changes found in xe-pw-174724v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#7225])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#3718] / [Intel XE#6078]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5901])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#7085])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5808]) +8 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#7679]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#5822]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5823] / [Intel XE#6918]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][14] ([Intel XE#7084] / [Intel XE#8150])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7358])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#8391])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#2252]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-0:
    - shard-ptl:          NOTRUN -> [FAIL][19] ([Intel XE#9333]) +20 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-0.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#6969]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2390] / [Intel XE#6974])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5832] / [Intel XE#6974])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#5900]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#5962]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#5962] / [Intel XE#7343])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#4302])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#9009])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#5907]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#8265])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_feature_discovery@hdr:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#9287])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_feature_discovery@hdr.html

  * igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][32] -> [FAIL][33] ([Intel XE#3098]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#2316]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-ptl:          [PASS][35] -> [FAIL][36] ([Intel XE#3321]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#3098] / [Intel XE#3149]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#7178]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7178] / [Intel XE#7351])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2311]) +9 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4141]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7061] / [Intel XE#7356])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#5800] / [Intel XE#6312]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#6312]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7061])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#7061])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#5812]) +33 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#7865]) +9 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2313]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdmi_audio_bw@dpms-audio-recovery:
    - shard-ptl:          NOTRUN -> [SKIP][52] ([Intel XE#9312])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7283]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#7283]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#5849])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#7304]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#5858])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#1406]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_psr@fbc-psr2-primary-render@edp-1.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5821]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_rotation_crc@bad-tiling.html
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#3904] / [Intel XE#7342])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - shard-ptl:          [PASS][64] -> [FAIL][65] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-4/igt@kms_vrr@flipline@pipe-a-edp-1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-1/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#5949] / [Intel XE#9277])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#7644])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#5764]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8370])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#7482]) +10 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#8374]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-imm:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#8374]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#8364]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#8364]) +14 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-ptl:          NOTRUN -> [DMESG-WARN][77] ([Intel XE#9130])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#8369])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#6196])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#9096])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#8378]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html

  * igt@xe_madvise@atomic-device:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#7980])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@xe_madvise@atomic-device.html

  * igt@xe_mempage_offline@inject-duplicate-page:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#9203])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_mempage_offline@inject-duplicate-page.html
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#9203])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_mempage_offline@inject-duplicate-page.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#6964])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#6964])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#7334]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-6/igt@xe_oa@non-zero-reason-all.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-6/igt@xe_oa@non-zero-reason-all.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#7793]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#7793])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#6867])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          NOTRUN -> [ABORT][93] ([Intel XE#9362])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          [PASS][94] -> [ABORT][95] ([Intel XE#9362]) +2 other tests abort
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-5/igt@xe_pm@s4-vm-bind-userptr.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#7599])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#4733] / [Intel XE#7417])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-bmg:          [ABORT][98] ([Intel XE#9405]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html
    - shard-ptl:          [ABORT][100] ([Intel XE#9394]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-5/igt@kms_async_flips@async-flip-suspend-resume.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2:
    - shard-bmg:          [ABORT][102] ([Intel XE#9375] / [Intel XE#9405]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][104] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][106] ([Intel XE#301]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][108] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-ptl:          [ABORT][110] ([Intel XE#9362]) -> [PASS][111] +3 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-8/igt@kms_flip@flip-vs-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [INCOMPLETE][112] ([Intel XE#9320]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][114] ([Intel XE#9341]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [FAIL][116] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [FAIL][118] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:
    - shard-bmg:          [ABORT][120] -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-4/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [DMESG-WARN][122] ([Intel XE#7727]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][124] ([Intel XE#3544]) -> [SKIP][125] ([Intel XE#3374] / [Intel XE#3544])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][126] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][127] ([Intel XE#2426] / [Intel XE#5848])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [DMESG-WARN][128] ([Intel XE#7727]) -> [ABORT][129] ([Intel XE#9362])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-6/igt@xe_pm@s4-mocs.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#9287]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9320
  [Intel XE#9333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333
  [Intel XE#9341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9341
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9394]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9394
  [Intel XE#9405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9405


Build changes
-------------

  * Linux: xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20 -> xe-pw-174724v3

  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20: 716b6714d3d0431dcab36ff242404fce0f03ec20
  xe-pw-174724v3: 174724v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/index.html

--===============5841423155663770246==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}: some suspend/shutdown/resume unification (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174724/">https://patchwork.freedesktop.org/series/174724/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20_FULL -&gt; xe-pw-174724v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174724v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-174724v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-174724v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@unload:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-8/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-1/igt@xe_module_load@unload.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174724v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225">Intel XE#7225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832">Intel XE#5832</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287">Intel XE#9287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@dpms-audio-recovery:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849">Intel XE#5849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_psr@fbc-psr2-primary-render@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-4/igt@kms_vrr@flipline@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-1/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949">Intel XE#5949</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@xe_ccs@vm-bind-fault-mode-decompress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-device:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@xe_madvise@atomic-device.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-duplicate-page:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_mempage_offline@inject-duplicate-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_mempage_offline@inject-duplicate-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-6/igt@xe_oa@non-zero-reason-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-6/igt@xe_oa@non-zero-reason-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334">Intel XE#7334</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@xe_page_reclaim@binds-large-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-2/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-5/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9405">Intel XE#9405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a></li>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-5/igt@kms_async_flips@async-flip-suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9394">Intel XE#9394</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-3/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9405">Intel XE#9405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-8/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-6/igt@kms_flip@flip-vs-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9320">Intel XE#9320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9341">Intel XE#9341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-8/igt@kms_vrr@flip-basic-fastset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-4/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20/shard-lnl-2/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174724v3/shard-lnl-6/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20 -&gt; xe-pw-174724v3</li>
</ul>
<p>IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5835-716b6714d3d0431dcab36ff242404fce0f03ec20: 716b6714d3d0431dcab36ff242404fce0f03ec20<br />
  xe-pw-174724v3: 174724v3</p>

</body>
</html>

--===============5841423155663770246==--
