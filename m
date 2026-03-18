Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3BE103E193
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 14:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D87410E733;
	Wed, 18 Mar 2026 14:54:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18ACF10E135;
 Wed, 18 Mar 2026 14:54:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2713495895131493846=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/display=3A_change?=
 =?utf-8?q?_pipe_allocation_order_for_discrete_platforms_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Mar 2026 14:54:58 -0000
Message-ID: <177384569806.372672.9576057892724241900@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316121837.1264876-1-jani.nikula@intel.com>
In-Reply-To: <20260316121837.1264876-1-jani.nikula@intel.com>
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

--===============2713495895131493846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: change pipe allocation order for discrete platforms (rev5)
URL   : https://patchwork.freedesktop.org/series/157782/
State : failure

== Summary ==

CI Bug Log - changes from xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab_FULL -> xe-pw-157782v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157782v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157782v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157782v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@xe_module_load@many-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][7] ([Intel XE#2341]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-3/igt@kms_content_protection@lic-type-0.html

  
New tests
---------

  New tests have been introduced between xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab_FULL and xe-pw-157782v5_FULL:

### New IGT tests (5) ###

  * igt@kms_setmode@basic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.12] s

  * igt@kms_setmode@clone-exclusive-crtc@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_setmode@clone-exclusive-crtc@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-c-dp-2-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_setmode@invalid-clone-single-crtc@pipe-c-dp-2-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  

Known issues
------------

  Here are the changes found in xe-pw-157782v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#6779])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7059] / [Intel XE#7085])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367] / [Intel XE#7354]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2252]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2320])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][23] ([Intel XE#5354])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2291]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1340])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1340] / [Intel XE#7435])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#3009])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2244])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2316]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-10/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2316]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7178] / [Intel XE#7351])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7178] / [Intel XE#7349])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4141]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2311]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2312]) +12 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2313]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#1503])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-10/igt@kms_hdr@static-toggle.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6911] / [Intel XE#7378])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7130]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#6814] / [Intel XE#7428])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1489]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2330] / [Intel XE#5813])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-lnl-7/igt@kms_vrr@flipline.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-lnl-3/igt@kms_vrr@flipline.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#4837]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][53] -> [INCOMPLETE][54] ([Intel XE#6321]) +1 other test incomplete
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7140])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7136]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#6874]) +9 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#5625])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#6703]) +185 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-malloc-race.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_exec_system_allocator@twice-mmap-remap-ro:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#6557] / [Intel XE#6703])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_exec_system_allocator@twice-mmap-remap-ro.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-remap-ro.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7138]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6964])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#944]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][69] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][71] ([Intel XE#2291]) -> [PASS][72] +2 other tests pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [DMESG-WARN][73] ([Intel XE#5354]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [SKIP][77] ([Intel XE#2316]) -> [PASS][78] +3 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][79] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][81] ([Intel XE#4596]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][83] ([Intel XE#1435]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][85] ([Intel XE#4459]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][87] ([Intel XE#5625]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][89] ([Intel XE#2328] / [Intel XE#7367]) -> [SKIP][90] ([Intel XE#6703])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][91] ([Intel XE#1124]) -> [SKIP][92] ([Intel XE#6703]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][93] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][94] ([Intel XE#6703])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][95] ([Intel XE#3432]) -> [SKIP][96] ([Intel XE#6703])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][97] ([Intel XE#2887]) -> [SKIP][98] ([Intel XE#6703]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          [SKIP][99] ([Intel XE#2252]) -> [SKIP][100] ([Intel XE#6703]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][101] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][102] ([Intel XE#6703])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_content_protection@atomic.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][103] ([Intel XE#7194]) -> [FAIL][104] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][105] ([Intel XE#2320]) -> [SKIP][106] ([Intel XE#6703]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][107] ([Intel XE#2320]) -> [SKIP][108] ([Intel XE#6557] / [Intel XE#6703])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][109] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][110] ([Intel XE#6703])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][111] ([Intel XE#2374] / [Intel XE#6128]) -> [SKIP][112] ([Intel XE#6703])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_feature_discovery@psr2.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][113] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][114] ([Intel XE#6703])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][115] ([Intel XE#2312]) -> [SKIP][116] ([Intel XE#2311]) +6 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][117] ([Intel XE#2311]) -> [SKIP][118] ([Intel XE#6703]) +10 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][119] ([Intel XE#2312]) -> [SKIP][120] ([Intel XE#4141])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][121] ([Intel XE#4141]) -> [SKIP][122] ([Intel XE#6703]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][123] ([Intel XE#4141]) -> [SKIP][124] ([Intel XE#2312]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][125] ([Intel XE#2311]) -> [SKIP][126] ([Intel XE#2312]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][127] ([Intel XE#2311]) -> [SKIP][128] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][129] ([Intel XE#2312]) -> [SKIP][130] ([Intel XE#2313]) +8 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][131] ([Intel XE#2313]) -> [SKIP][132] ([Intel XE#6703]) +6 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][133] ([Intel XE#2313]) -> [SKIP][134] ([Intel XE#2312]) +6 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][135] ([Intel XE#7308]) -> [SKIP][136] ([Intel XE#6703])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-bmg:          [SKIP][137] ([Intel XE#7283]) -> [SKIP][138] ([Intel XE#6703])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][139] ([Intel XE#2393]) -> [SKIP][140] ([Intel XE#6703])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][141] ([Intel XE#1489]) -> [SKIP][142] ([Intel XE#6703]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][143] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][144] ([Intel XE#6703]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][145] ([Intel XE#6503]) -> [SKIP][146] ([Intel XE#6703])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_sharpness_filter@filter-formats.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][147] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][148] ([Intel XE#2426] / [Intel XE#5848])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-bmg:          [SKIP][149] ([Intel XE#4837]) -> [SKIP][150] ([Intel XE#6703]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_eudebug@basic-exec-queues-enable.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-bmg:          [SKIP][151] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][152] ([Intel XE#6703]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][153] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][154] ([Intel XE#6703]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][155] ([Intel XE#7136]) -> [SKIP][156] ([Intel XE#6703]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][157] ([Intel XE#6874]) -> [SKIP][158] ([Intel XE#6703]) +7 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [INCOMPLETE][159] ([Intel XE#7098]) -> [SKIP][160] ([Intel XE#6703])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-bmg:          [SKIP][161] ([Intel XE#7138]) -> [SKIP][162] ([Intel XE#6703]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][163] ([Intel XE#6281] / [Intel XE#7426]) -> [SKIP][164] ([Intel XE#6703])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][165] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517]) -> [SKIP][166] ([Intel XE#6703])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          [SKIP][167] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][168] ([Intel XE#6703])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          [SKIP][169] ([Intel XE#944]) -> [SKIP][170] ([Intel XE#6703])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab -> xe-pw-157782v5

  IGT_8806: 8806
  xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab: 9a7eaa045a430ecf1ced87894f3aa54e3ab146ab
  xe-pw-157782v5: 157782v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/index.html

--===============2713495895131493846==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: change pipe allocation order for discrete platforms (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157782/">https://patchwork.freedesktop.org/series/157782/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab_FULL -&gt; xe-pw-157782v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157782v5_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157782v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157782v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_module_load@many-reload.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@lic-type-0:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-3/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab_FULL and xe-pw-157782v5_FULL:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_setmode@basic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-c-dp-2-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc@pipe-c-dp-2-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157782v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-10/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-10/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-lnl-7/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-lnl-3/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_evict@evict-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-malloc-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +185 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-ro:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_exec_system_allocator@twice-mmap-remap-ro.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-remap-ro.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373">Intel XE#7373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194">Intel XE#7194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157782v5/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab -&gt; xe-pw-157782v5</li>
</ul>
<p>IGT_8806: 8806<br />
  xe-4733-9a7eaa045a430ecf1ced87894f3aa54e3ab146ab: 9a7eaa045a430ecf1ced87894f3aa54e3ab146ab<br />
  xe-pw-157782v5: 157782v5</p>

</body>
</html>

--===============2713495895131493846==--
