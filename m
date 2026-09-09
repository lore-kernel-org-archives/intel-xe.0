Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEBEC79FB5
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 02:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4021E10EE58;
	Wed,  9 Sep 2026 02:50:15 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0269210EE56;
 Wed,  9 Sep 2026 02:50:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2250271036798214029=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Keep_walking_on_?=
 =?utf-8?q?SVM_eviction_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 02:50:13 -0000
Message-ID: <178892221399.137999.1717697408301383718@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908184346.92332-1-matthew.brost@intel.com>
In-Reply-To: <20260908184346.92332-1-matthew.brost@intel.com>
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

--===============2250271036798214029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Keep walking on SVM eviction failure
URL   : https://patchwork.freedesktop.org/series/173621/
State : failure

== Summary ==

CI Bug Log - changes from xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d_FULL -> xe-pw-173621v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-173621v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-173621v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-173621v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-4/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  
Known issues
------------

  Here are the changes found in xe-pw-173621v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-read:
    - shard-lnl:          [PASS][3] -> [SKIP][4] ([Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@fbdev@unaligned-read.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@fbdev@unaligned-read.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2887])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2652]) +8 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7358])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_color@ctm-signed:
    - shard-lnl:          [PASS][13] -> [SKIP][14] ([Intel XE#3297])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_color@ctm-signed.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_color@ctm-signed.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-lnl:          [PASS][15] -> [SKIP][16] ([Intel XE#7006])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_color_pipeline@plane-lut1d.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2320])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1424])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][20] -> [SKIP][21] ([Intel XE#9125]) +24 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev@basic:
    - shard-lnl:          [PASS][22] -> [SKIP][23] ([Intel XE#3009])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_dp_aux_dev@basic.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#8265])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#8265])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_feature_discovery@dsc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#8586])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [PASS][27] -> [FAIL][28] ([Intel XE#3098]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-lnl:          [PASS][29] -> [SKIP][30] ([Intel XE#2482]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip@basic-flip-vs-modeset.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-lnl:          [PASS][31] -> [SKIP][32] ([Intel XE#9132])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip@flip-vs-dpms-on-nop.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-lnl:          [PASS][33] -> [SKIP][34] ([Intel XE#1745] / [Intel XE#9144]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2311]) +12 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#6312]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [PASS][38] -> [SKIP][39] ([Intel XE#7779])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#656] / [Intel XE#7905]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4141]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#6312] / [Intel XE#651])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7905])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7865])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7061] / [Intel XE#7356])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-lnl:          [PASS][46] -> [SKIP][47] ([Intel XE#2548] / [Intel XE#7779]) +10 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2313]) +13 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-lnl:          [PASS][49] -> [SKIP][50] ([Intel XE#2568]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_invalid_mode@uint-max-clock.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#6901])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7591])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-lnl:          [PASS][53] -> [SKIP][54] ([Intel XE#7687] / [Intel XE#9125])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@invalid-parameters.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-lnl:          [PASS][55] -> [SKIP][56] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-lnl:          [PASS][57] -> [SKIP][58] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#8396]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-lnl:          [PASS][62] -> [SKIP][63] ([Intel XE#7643])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_pm_lpsp@kms-lpsp.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-lnl:          [PASS][64] -> [SKIP][65] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_pm_rpm@dpms-lpsp.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-lnl:          [PASS][66] -> [SKIP][67] ([Intel XE#9129])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_properties@crtc-properties-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#4608]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1489]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-lnl:          [PASS][71] -> [SKIP][72] ([Intel XE#1489]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2387] / [Intel XE#7429])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-suspend@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_psr@fbc-psr2-suspend@edp-1.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [PASS][76] -> [SKIP][77] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][78] -> [SKIP][79] ([Intel XE#7795])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1127] / [Intel XE#5813])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#6503])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_sharpness_filter@filter-strength.html

  * igt@xe_configfs@survivability-mode:
    - shard-bmg:          [PASS][82] -> [ABORT][83] ([Intel XE#8007])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-5/igt@xe_configfs@survivability-mode.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-6/igt@xe_configfs@survivability-mode.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][84] -> [INCOMPLETE][85] ([Intel XE#6321] / [Intel XE#8355])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#7482]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2322] / [Intel XE#7372])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#8374]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@max-queues-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#8364]) +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#8364]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@xe_exec_multi_queue@two-queues-close-fd-smem.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#8378])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html

  * igt@xe_pm@s3-basic-exec:
    - shard-bmg:          [PASS][92] -> [INCOMPLETE][93] ([Intel XE#8175])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-5/igt@xe_pm@s3-basic-exec.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-6/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#4650] / [Intel XE#7347])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#4733] / [Intel XE#7417])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - shard-lnl:          [SKIP][96] ([Intel XE#2134]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@fbdev@eof.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@fbdev@eof.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][98] ([Intel XE#9125]) -> [PASS][99] +23 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][100] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-lnl:          [SKIP][102] ([Intel XE#3297]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_color@legacy-gamma-reset.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-lnl:          [SKIP][104] ([Intel XE#7006]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-lnl:          [SKIP][106] ([Intel XE#9127]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-1x:
    - shard-lnl:          [SKIP][108] ([Intel XE#702]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_feature_discovery@display-1x.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_feature_discovery@display-1x.html

  * igt@kms_feature_discovery@psr2:
    - shard-lnl:          [SKIP][110] ([Intel XE#1135] / [Intel XE#6128]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_feature_discovery@psr2.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [FAIL][112] ([Intel XE#3098]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-lnl:          [SKIP][114] ([Intel XE#2482]) -> [PASS][115] +1 other test pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-lnl:          [SKIP][116] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][117] +5 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][118] ([Intel XE#7779]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-lnl:          [SKIP][120] ([Intel XE#2568]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_invalid_mode@bad-hsync-end.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [SKIP][122] ([Intel XE#9128]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane@plane-position-hole.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-lnl:          [SKIP][124] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          [SKIP][126] ([Intel XE#870]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_backlight@basic-brightness.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [SKIP][128] ([Intel XE#7794]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [SKIP][130] ([Intel XE#4886]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][132] ([Intel XE#1489]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-lnl:          [SKIP][134] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][135] +2 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][136] ([Intel XE#7795]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          [SKIP][138] ([Intel XE#3279]) -> [SKIP][139] ([Intel XE#9125])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][140] ([Intel XE#1407]) -> [SKIP][141] ([Intel XE#9125]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][142] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][143] ([Intel XE#9125])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          [SKIP][144] ([Intel XE#9125]) -> [SKIP][145] ([Intel XE#1407]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][146] ([Intel XE#9125]) -> [SKIP][147] ([Intel XE#1428] / [Intel XE#7387])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          [SKIP][148] ([Intel XE#1124]) -> [SKIP][149] ([Intel XE#9125]) +5 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          [SKIP][150] ([Intel XE#9125]) -> [SKIP][151] ([Intel XE#1124]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][152] ([Intel XE#9125]) -> [SKIP][153] ([Intel XE#8365])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][154] ([Intel XE#367]) -> [SKIP][155] ([Intel XE#9125])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][156] ([Intel XE#8365]) -> [SKIP][157] ([Intel XE#9125]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][158] ([Intel XE#2887]) -> [SKIP][159] ([Intel XE#9125]) +4 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][160] ([Intel XE#9125]) -> [SKIP][161] ([Intel XE#2887]) +8 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          [SKIP][162] ([Intel XE#9125]) -> [SKIP][163] ([Intel XE#3432])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          [SKIP][164] ([Intel XE#3432]) -> [SKIP][165] ([Intel XE#9125]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          [SKIP][166] ([Intel XE#4417] / [Intel XE#5447]) -> [SKIP][167] ([Intel XE#9125])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cdclk@mode-transition.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-lnl:          [SKIP][168] ([Intel XE#9125]) -> [SKIP][169] ([Intel XE#307] / [Intel XE#6974])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          [SKIP][170] ([Intel XE#9125]) -> [SKIP][171] ([Intel XE#6974])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][172] ([Intel XE#307] / [Intel XE#6974]) -> [SKIP][173] ([Intel XE#9125]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_content_protection@dp-mst-type-1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-lnl:          [SKIP][174] ([Intel XE#9125]) -> [SKIP][175] ([Intel XE#1424]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          [SKIP][176] ([Intel XE#1424]) -> [SKIP][177] ([Intel XE#9125]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-lnl:          [SKIP][178] ([Intel XE#9125]) -> [SKIP][179] ([Intel XE#309] / [Intel XE#7343])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][180] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][181] ([Intel XE#309] / [Intel XE#7343])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [SKIP][182] ([Intel XE#9125]) -> [SKIP][183] ([Intel XE#323] / [Intel XE#6035])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-lnl:          [SKIP][184] ([Intel XE#8265]) -> [SKIP][185] ([Intel XE#9125]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          [SKIP][186] ([Intel XE#9125]) -> [SKIP][187] ([Intel XE#8265]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][188] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) -> [SKIP][189] ([Intel XE#1745] / [Intel XE#9144])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][190] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][191] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][192] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][193] ([Intel XE#6312] / [Intel XE#651]) +6 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][194] ([Intel XE#7779]) -> [SKIP][195] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][196] ([Intel XE#7779]) -> [SKIP][197] ([Intel XE#7905]) +24 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:
    - shard-lnl:          [SKIP][198] ([Intel XE#7779]) -> [SKIP][199] ([Intel XE#6312]) +6 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][200] ([Intel XE#6312]) -> [SKIP][201] ([Intel XE#7779]) +8 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-lnl:          [SKIP][202] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][203] ([Intel XE#2548] / [Intel XE#7779]) +7 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][204] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][205] ([Intel XE#7779]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][206] ([Intel XE#7905]) -> [SKIP][207] ([Intel XE#7779]) +19 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][208] ([Intel XE#7779]) -> [SKIP][209] ([Intel XE#7061])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][210] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][211] ([Intel XE#656] / [Intel XE#7905]) +18 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][212] ([Intel XE#7779]) -> [SKIP][213] ([Intel XE#7865]) +15 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
    - shard-lnl:          [SKIP][214] ([Intel XE#7865]) -> [SKIP][215] ([Intel XE#7779]) +13 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          [SKIP][216] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][217] ([Intel XE#2548] / [Intel XE#7779]) +18 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][218] ([Intel XE#7061]) -> [SKIP][219] ([Intel XE#7779]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][220] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][221] ([Intel XE#3544])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          [SKIP][222] ([Intel XE#9125]) -> [SKIP][223] ([Intel XE#1503])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_hdr@static-swap.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_hdr@static-swap.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          [SKIP][224] ([Intel XE#6912] / [Intel XE#7375]) -> [SKIP][225] ([Intel XE#9125])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          [SKIP][226] ([Intel XE#9125]) -> [SKIP][227] ([Intel XE#599])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_lowres@tiling-y.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-lnl:          [SKIP][228] ([Intel XE#9125]) -> [SKIP][229] ([Intel XE#4596] / [Intel XE#5854])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-x.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][230] ([Intel XE#9125]) -> [SKIP][231] ([Intel XE#5020] / [Intel XE#7348])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-lnl:          [SKIP][232] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][233] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:
    - shard-lnl:          [SKIP][234] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][235] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][236] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][237] ([Intel XE#1489])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][238] ([Intel XE#1489]) -> [SKIP][239] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][240] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][241] ([Intel XE#1489])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          [SKIP][242] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][243] ([Intel XE#2850] / [Intel XE#929])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          [SKIP][244] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][245] ([Intel XE#1406] / [Intel XE#7345])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-lnl:          [SKIP][246] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][247] ([Intel XE#1406]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@pr-sprite-plane-move.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          [SKIP][248] ([Intel XE#1406]) -> [SKIP][249] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr@pr-sprite-render.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          [SKIP][250] ([Intel XE#9125]) -> [SKIP][251] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-lnl:          [SKIP][252] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][253] ([Intel XE#9125])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [ABORT][254] ([Intel XE#8963]) -> [DMESG-WARN][255] ([Intel XE#8963])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@xe_wedged@basic-wedged.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7347]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7347
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7643
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
  [Intel XE#9132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d -> xe-pw-173621v1

  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d: 5cb17454a3e04fcc1133d87451c9c582c297e92d
  xe-pw-173621v1: 173621v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/index.html

--===============2250271036798214029==
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
<tr><td><b>Series:</b></td><td>drm/xe: Keep walking on SVM eviction failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173621/">https://patchwork.freedesktop.org/series/173621/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d_FULL -&gt; xe-pw-173621v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-173621v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-173621v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-173621v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_dc@dc5-dpms-suspend-resume:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-4/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173621v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_color@ctm-signed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_color_pipeline@plane-lut1d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_dp_aux_dev@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip@flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132">Intel XE#9132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_invalid_mode@uint-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@invalid-parameters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7643">Intel XE#7643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_properties@crtc-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_properties@crtc-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129">Intel XE#9129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_psr@fbc-psr2-suspend@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_sharpness_filter@filter-strength.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-5/igt@xe_configfs@survivability-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-6/igt@xe_configfs@survivability-mode.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@xe_exec_multi_queue@two-queues-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-5/igt@xe_pm@s3-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-6/igt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7347">Intel XE#7347</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_color@legacy-gamma-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_color@legacy-gamma-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127">Intel XE#9127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_fbcon_fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_feature_discovery@display-1x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane@plane-position-hole.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_pm_backlight@basic-brightness.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447">Intel XE#5447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-8/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173621v1/shard-lnl-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d -&gt; xe-pw-173621v1</li>
</ul>
<p>IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d: 5cb17454a3e04fcc1133d87451c9c582c297e92d<br />
  xe-pw-173621v1: 173621v1</p>

</body>
</html>

--===============2250271036798214029==--
