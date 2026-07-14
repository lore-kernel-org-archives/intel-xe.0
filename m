Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B401DC4450C
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 20:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0DC10EE49;
	Tue, 14 Jul 2026 20:13:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E2710EE4D;
 Tue, 14 Jul 2026 20:13:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2224098267434041481=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_memory_page_offlining_?=
 =?utf-8?q?support_=28rev13=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jul 2026 20:13:45 -0000
Message-ID: <178406002500.189998.9214725900976149275@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260714134900.1283308-13-tejas.upadhyay@intel.com>
In-Reply-To: <20260714134900.1283308-13-tejas.upadhyay@intel.com>
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

--===============2224098267434041481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add memory page offlining support (rev13)
URL   : https://patchwork.freedesktop.org/series/161473/
State : failure

== Summary ==

CI Bug Log - changes from xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366_FULL -> xe-pw-161473v13_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161473v13_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161473v13_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161473v13_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-8/igt@kms_async_flips@async-flip-suspend-resume.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-2/igt@kms_async_flips@async-flip-suspend-resume.html

  
Known issues
------------

  Here are the changes found in xe-pw-161473v13_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7679])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2887])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#3432])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#373])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2325] / [Intel XE#7358])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2390] / [Intel XE#6974])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1424])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#7809])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#8265])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#8265]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#4422] / [Intel XE#7442])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1421])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#301])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2311]) +16 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#656] / [Intel XE#7905]) +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#7061] / [Intel XE#7356])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4141]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#6312] / [Intel XE#651])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1469] / [Intel XE#7399]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#6312])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [ABORT][33] ([Intel XE#8007])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7905]) +8 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7061] / [Intel XE#7356])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2313]) +12 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7865]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7061]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#6912] / [Intel XE#7375])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7283])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#8303]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7283])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1489]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1406] / [Intel XE#7345])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1406] / [Intel XE#4609])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_psr@psr2-suspend.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2426] / [Intel XE#5848])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1091] / [Intel XE#2849])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute@eu-busy-10s:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#6592] / [Intel XE#6645] / [Intel XE#7391])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_compute@eu-busy-10s.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_balancer@no-exec-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7482]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_exec_balancer@no-exec-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1392])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#8374])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#8374]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#8364]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@two-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#8364]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-basic-smem.html

  * igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:
    - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#7956])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-2/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-1/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#8378]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#8378]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7954])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91]) -> ([PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [SKIP][116], [PASS][117]) ([Intel XE#378] / [Intel XE#7405])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-3/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-6/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-6/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-7/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-7/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-1/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-1/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-1/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-2/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-3/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-5/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-3/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-7/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-4/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-8/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-8/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-8/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-4/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-4/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-5/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-5/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-2/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-2/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-4/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-6/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-5/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-6/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-8/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-1/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-1/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-1/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-8/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-8/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-4/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-4/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-4/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-3/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-3/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-2/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-2/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-2/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-5/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-5/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-6/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-6/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-6/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#6964])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2284] / [Intel XE#7370])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_pm@d3cold-basic.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#7599])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#944])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#944])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#4273])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [ABORT][124] ([Intel XE#8007]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-10/igt@core_hotunplug@hotunbind-rebind.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-lnl:          [FAIL][126] ([Intel XE#3718] / [Intel XE#7265]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][128] ([Intel XE#7265]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][130] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-media:
    - shard-bmg:          [FAIL][132] ([Intel XE#7850]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-media.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-5/igt@xe_exec_reset@long-spin-reuse-many-preempt-media.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [ABORT][134] ([Intel XE#3119]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-2/igt@xe_wedged@basic-wedged.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_wedged@basic-wedged.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][136] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][137] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][138] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][139] ([Intel XE#1729] / [Intel XE#7424])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592
  [Intel XE#6645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366 -> xe-pw-161473v13

  IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366: d3709d2bd13debee032d55c0dd71f145e11ec366
  xe-pw-161473v13: 161473v13

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/index.html

--===============2224098267434041481==
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
<tr><td><b>Series:</b></td><td>Add memory page offlining support (rev13)</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/161473/">https://patchwork.freedesktop.org/series/161473/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-161473v13/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-161473v13/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5398-d3709d2bd13debee032d55c0dd71f145e=
11ec366_FULL -&gt; xe-pw-161473v13_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161473v13_FULL absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-161473v13_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1614=
73v13_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_async_flips@async-flip-suspend-resume:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-8/igt@kms_asyn=
c_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-2/igt@kms_async_=
flips@async-flip-suspend-resume.html">INCOMPLETE</a> +1 other test incomple=
te</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161473v13_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_big_fb@4-tiled-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_bw@connected-linear-tili=
ng-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_ccs@bad-pixel-format-y-t=
iled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_ccs@crc-primary-basic-y-=
tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-=
yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_chamelium_audio@dp-audio=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_chamelium_color@ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_chamelium_frames@hdmi-cr=
c-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-7/igt@kms_content_protection@dp-ms=
t-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_cursor_crc@cursor-offscr=
een-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_cursor_crc@cursor-offscr=
een-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_cursor_crc@cursor-random=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_cursor_legacy@2x-long-fl=
ip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-6/igt@=
kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_dsc@dsc-with-output-form=
ats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_flip@2x-modeset-vs-vblan=
k-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-5/i=
gt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@drr=
s-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-blt:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
drrshdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc=
drrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
hdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc=
psr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc=
psr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
psrhdr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_frontbuffer_tracking@psr=
hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8=
888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_plane@pixel-format-4-til=
ed-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_plane@pixel-format-x-til=
ed-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_plane@pixel-format-yf-ti=
led-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_pm_backlight@bad-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-plane-mov=
e-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plan=
e-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-plan=
e-onoff@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_psr@psr2-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/223=
4">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-=
unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_compute@eu-busy-10s.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
592">Intel XE#6592</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6645">Intel XE#6645</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7391">Intel XE#7391</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_create@multigpu-create-ma=
ssive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2504">Intel XE#2504</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_evict_ccs@evict-overcommi=
t-parallel-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_exec_balancer@no-exec-par=
allel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_exec_basic@multigpu-no-ex=
ec-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_exec_fault_mode@many-mult=
i-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_exec_fault_mode@once-mult=
i-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_exec_multi_queue@max-queu=
es-preempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_exec_multi_queue@two-queu=
es-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-2/igt@xe_exec_=
reset@long-spin-many-preempt-gt1-threads.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-1/igt@xe_=
exec_reset@long-spin-many-preempt-gt1-threads.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_exec_threads@threads-mult=
i-queue-cm-fd-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_exec_threads@threads-mult=
i-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_gpgpu_fill@offset-4x4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/sha=
rd-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11e=
c366/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145=
e11ec366/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71=
f145e11ec366/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0=
dd71f145e11ec366/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d=
55c0dd71f145e11ec366/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee=
032d55c0dd71f145e11ec366/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13d=
ebee032d55c0dd71f145e11ec366/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d3709d2b=
d13debee032d55c0dd71f145e11ec366/shard-lnl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-d370=
9d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5398-=
d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/sh=
ard-lnl-6/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161473v13/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-l=
nl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
161473v13/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-161473v13/shard-lnl-1/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-161473v13/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-161473v13/shard-lnl-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473=
v13/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-161473v13/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-ln=
l-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
61473v13/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/sha=
rd-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-161473v13/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_module_load@load.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473=
v13/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#740=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_multigpu_svm@mgpu-latency=
-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_pm@d3cold-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_prefetch_fault@prefetch-f=
ault-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@xe_query@multigpu-query-inva=
lid-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_query@multigpu-query-uc-f=
w-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_sriov_flr@flr-vfs-paralle=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-10/igt@core_ho=
tunplug@hotunbind-rebind.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-bmg-8/igt@core=
_hotunplug@hotunbind-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-3/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7=
265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
61473v13/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-3/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#72=
65</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
1473v13/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pi=
pe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-9/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1614=
73v13/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-media:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-10/igt@xe_exec=
_reset@long-spin-reuse-many-preempt-media.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shar=
d-bmg-5/igt@xe_exec_reset@long-spin-reuse-many-preempt-media.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-2/igt@xe_wedge=
d@basic-wedged.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3119">Intel XE#3119</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/shard-lnl-7/igt@xe_wedged@basi=
c-wedged.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-lnl-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel X=
E#7343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-161473v13/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v13/sha=
rd-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424"=
>Intel XE#7424</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366 -&gt; xe-pw-161=
473v13</li>
</ul>
<p>IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5398-d3709d2bd13debee032d55c0dd71f145e11ec366: d3709d2bd13debee032d55c=
0dd71f145e11ec366<br />
  xe-pw-161473v13: 161473v13</p>

</body>
</html>

--===============2224098267434041481==--
