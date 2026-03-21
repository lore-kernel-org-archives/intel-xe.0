Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCE61099B3C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Mar 2026 03:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E55710E04A;
	Sat, 21 Mar 2026 03:59:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA6110E04A;
 Sat, 21 Mar 2026 03:59:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5643599141714332500=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/fwctl=3A_Add_FWCTL_?=
 =?utf-8?q?interface_for_Xe_firmware_management?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 21 Mar 2026 03:59:52 -0000
Message-ID: <177406559281.383014.7072806182967778727@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
In-Reply-To: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
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

--===============5643599141714332500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/fwctl: Add FWCTL interface for Xe firmware management
URL   : https://patchwork.freedesktop.org/series/163562/
State : failure

== Summary ==

CI Bug Log - changes from xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a_FULL -> xe-pw-163562v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163562v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163562v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163562v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@forked-move:
    - shard-bmg:          [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_cursor_legacy@forked-move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_cursor_legacy@forked-move.html

  * igt@kms_cursor_legacy@forked-move@all-pipes:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_cursor_legacy@forked-move@all-pipes.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_cursor_legacy@forked-move@all-pipes.html

  
Known issues
------------

  Here are the changes found in xe-pw-163562v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#6779])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@core_hotunplug@unplug-rescan.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7059] / [Intel XE#7085])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2328] / [Intel XE#7367])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#7621])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367] / [Intel XE#7354]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652]) +8 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3432]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3432])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +8 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2724] / [Intel XE#7449])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2252]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#6974])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#6707] / [Intel XE#7439])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2321] / [Intel XE#7355]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2291])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#1340])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2244]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2316]) +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2316])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2311]) +15 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7061] / [Intel XE#7356])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4141]) +8 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2352] / [Intel XE#7399])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2312]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2313]) +11 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1503])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#1503])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@kms_hdr@static-toggle.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6901])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#7086])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7283]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2393])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#7340] / [Intel XE#7504])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2499])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1489]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@kms_psr@psr-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][53] -> [SKIP][54] ([Intel XE#4692] / [Intel XE#7508])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2330] / [Intel XE#5813])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#6503])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#1499])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#6599])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#4837]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4837] / [Intel XE#6665]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][62] -> [INCOMPLETE][63] ([Intel XE#6321])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7136]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#6874]) +20 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html

  * igt@xe_exec_multi_queue@one-queue-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#6874]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#6703]) +109 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7138]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97]) -> ([SKIP][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123]) ([Intel XE#2457] / [Intel XE#7405])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-4/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-9/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-4/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-9/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-7/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-7/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-9/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-6/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-6/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-4/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-4/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#6964]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-coherency-conflict.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1420])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2284] / [Intel XE#7370])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#6703]) +26 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_sriov_flr@flr-basic@numvfs-1:
    - shard-bmg:          [PASS][129] -> [FAIL][130] ([Intel XE#5937]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@xe_sriov_flr@flr-basic@numvfs-1.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_sriov_flr@flr-basic@numvfs-1.html

  
#### Possible fixes ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][131] ([Intel XE#7445]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][133] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][135] ([Intel XE#2291]) -> [PASS][136] +2 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][137] ([Intel XE#2291] / [Intel XE#7343]) -> [PASS][138] +2 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][139] ([Intel XE#2316]) -> [PASS][140] +6 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][141] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][143] ([Intel XE#301]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_plane_cursor@overlay:
    - shard-bmg:          [FAIL][145] -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@kms_plane_cursor@overlay.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@kms_plane_cursor@overlay.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][147] ([Intel XE#5625]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
    - shard-bmg:          [ABORT][149] -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html

  * igt@xe_pm@s2idle-mocs:
    - shard-bmg:          [INCOMPLETE][151] -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@xe_pm@s2idle-mocs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_pm@s2idle-mocs.html

  * igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:
    - shard-bmg:          [FAIL][153] ([Intel XE#5937]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][155] ([Intel XE#2327]) -> [SKIP][156] ([Intel XE#6703])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][157] ([Intel XE#1124]) -> [SKIP][158] ([Intel XE#6703]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          [SKIP][159] ([Intel XE#367] / [Intel XE#7354]) -> [SKIP][160] ([Intel XE#6703])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][161] ([Intel XE#3432]) -> [SKIP][162] ([Intel XE#6703])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][163] ([Intel XE#2887]) -> [SKIP][164] ([Intel XE#6703]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][165] ([Intel XE#2652]) -> [SKIP][166] ([Intel XE#6703])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][167] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][168] ([Intel XE#6703])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_chamelium_color@degamma.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          [FAIL][169] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][170] ([Intel XE#7194])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_content_protection@legacy-hdcp14.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][171] ([Intel XE#2341]) -> [FAIL][172] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_content_protection@srm.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][173] ([Intel XE#2341]) -> [FAIL][174] ([Intel XE#6707] / [Intel XE#7439])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_content_protection@uevent.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][175] ([Intel XE#2291]) -> [SKIP][176] ([Intel XE#6703])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][177] ([Intel XE#1508]) -> [SKIP][178] ([Intel XE#6703])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][179] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][180] ([Intel XE#6703])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][181] ([Intel XE#2312]) -> [SKIP][182] ([Intel XE#2311]) +14 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][183] ([Intel XE#2311]) -> [SKIP][184] ([Intel XE#2312]) +17 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][185] ([Intel XE#2311]) -> [SKIP][186] ([Intel XE#6703]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][187] ([Intel XE#4141]) -> [SKIP][188] ([Intel XE#6703]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][189] ([Intel XE#4141]) -> [SKIP][190] ([Intel XE#2312]) +10 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][191] ([Intel XE#2312]) -> [SKIP][192] ([Intel XE#4141]) +10 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][193] ([Intel XE#2313]) -> [SKIP][194] ([Intel XE#6703]) +5 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][195] ([Intel XE#2312]) -> [SKIP][196] ([Intel XE#2313]) +12 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][197] ([Intel XE#2313]) -> [SKIP][198] ([Intel XE#2312]) +10 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][199] ([Intel XE#4090] / [Intel XE#7443]) -> [SKIP][200] ([Intel XE#6703])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][201] ([Intel XE#2486]) -> [SKIP][202] ([Intel XE#6703])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-4/igt@kms_panel_fitting@legacy.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][203] ([Intel XE#7283]) -> [SKIP][204] ([Intel XE#6703])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][205] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][206] ([Intel XE#6703])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][207] ([Intel XE#3309] / [Intel XE#7368]) -> [SKIP][208] ([Intel XE#6703])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-9/igt@kms_pm_dc@dc5-retention-flops.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][209] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][210] ([Intel XE#6703])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][211] ([Intel XE#1489]) -> [SKIP][212] ([Intel XE#6703]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][213] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][214] ([Intel XE#6703]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][215] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][216] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][217] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][218] ([Intel XE#3904] / [Intel XE#7342]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-bmg:          [SKIP][219] ([Intel XE#4837]) -> [SKIP][220] ([Intel XE#6703])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1/igt@xe_eudebug@discovery-race-sigint.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-bmg:          [SKIP][221] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][222] ([Intel XE#6703])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@xe_eudebug_online@tdctl-parameters.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          [SKIP][223] ([Intel XE#7140]) -> [SKIP][224] ([Intel XE#6703]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-9/igt@xe_evict@evict-small-external-multi-queue-cm.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          [SKIP][225] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][226] ([Intel XE#6703]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-imm:
    - shard-bmg:          [SKIP][227] ([Intel XE#7136]) -> [SKIP][228] ([Intel XE#6703]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-rebind-imm.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-rebind-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][229] ([Intel XE#6874]) -> [SKIP][230] ([Intel XE#6703]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-rebind-err:
    - shard-bmg:          [SKIP][231] ([Intel XE#7138]) -> [SKIP][232] ([Intel XE#6703])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-rebind-err.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-rebind-err.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][233] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][234] ([Intel XE#6703])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][235] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][236] ([Intel XE#6703])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][237] ([Intel XE#944]) -> [SKIP][238] ([Intel XE#6703])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@xe_query@multigpu-query-invalid-size.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [DMESG-WARN][239] ([Intel XE#5545]) -> [SKIP][240] ([Intel XE#6703])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
  [Intel XE#7508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508
  [Intel XE#7621]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8811 -> IGT_8813
  * Linux: xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a -> xe-pw-163562v1

  IGT_8811: cc3169e72592a56b806ce54a87060519151ad5fe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8813: 89e32100ca0e4ca343dd32408dacf1e879e8ed02 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a: 4ae9f18564e78a5447be68aa1e9232a4f2c37b5a
  xe-pw-163562v1: 163562v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/index.html

--===============5643599141714332500==
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
<tr><td><b>Series:</b></td><td>drm/xe/fwctl: Add FWCTL interface for Xe fir=
mware management</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/163562/">https://patchwork.freedesktop.org/series/163562/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-163562v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-163562v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4749-4ae9f18564e78a5447be68aa1e9232a4f=
2c37b5a_FULL -&gt; xe-pw-163562v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163562v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-163562v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1635=
62v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_curs=
or_legacy@forked-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_cursor_legacy@forke=
d-move.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@all-pipes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_curs=
or_legacy@forked-move@all-pipes.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_cursor_le=
gacy@forked-move@all-pipes.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163562v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@core_hot=
unplug@unplug-rescan.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@core_hotunplug@unplug-re=
scan.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stri=
de-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_bw@connected-linear-tilin=
g-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7621">Intel XE#7621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373">Intel XE#7373=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@kms_cdclk@mode-transition.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-6/igt@kms_content_protection@dp-mst=
-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding=
-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_cursor_=
legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_flip@=
2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_hdr@invalid-metadata-size=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@kms_hdr@=
static-toggle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@kms_hdr@static-toggle.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7086">Intel XE#7086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-lnl-3/igt@kms_pm_d=
c@dc5-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-163562v1/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel=
 XE#7340</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7504">Intel XE#7504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@kms_psr@psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234=
">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-lnl-6/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-lnl-2/igt@k=
ms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508"=
>Intel XE#7508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@kms_rotation_crc@primary-y-t=
iled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_sharpness_filter@filter-f=
ormats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@kms_vrr@flip-basic-fastset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@xe_compute@ccs-mode-compute-=
kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-d=
estroy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@xe_eudebug_online@set-breakpo=
int.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@xe_exec_basic@multigpu-no-ex=
ec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7=
372</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_exec_=
compute_mode@twice-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_exec_compute_mode=
@twice-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-lnl-2/igt@xe_exec_multi_queue@one-queue=
-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@xe_exec_=
system_allocator@process-many-large-execqueues-new-nomemset.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/s=
hard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-new-n=
omemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>) +109 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c3=
7b5a/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4=
f2c37b5a/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9=
232a4f2c37b5a/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be6=
8aa1e9232a4f2c37b5a/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a544=
7be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78=
a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f1856=
4e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-9/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f=
18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4749-4=
ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-47=
49-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1=
0/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-=
bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/sh=
ard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5=
a/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-3/igt@xe_mo=
dule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-163562v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-=
bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163562v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-163562v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-=
bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163562v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-=
bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-10/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-163562v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-163562v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shar=
d-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-163562v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shar=
d-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-163562v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-coherenc=
y-conflict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_pm@s4-multiple-execs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@xe_pxp@pxp-termination-key-up=
date-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-basic@numvfs-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@xe_sriov=
_flr@flr-basic@numvfs-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@xe_sriov_flr@flr-basi=
c@numvfs-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5937">Intel XE#5937</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@intel_hw=
mon@hwmon-write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7445">Intel XE#7445</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@intel_hwmon@hwm=
on-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7373">Intel XE#7373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-163562v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-=
displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-4/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel=
 XE#7343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-163562v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-4/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1635=
62v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@kms_plan=
e_cursor@overlay.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-163562v1/shard-bmg-8/igt@kms_plane_cursor@overlay.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-lnl-3/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#=
5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163562v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx=
-uc-multi-vma.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@xe_exec_=
threads@threads-hang-shared-vm-userptr-rebind.html">ABORT</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-9/ig=
t@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@xe_pm@s2=
idle-mocs.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_pm@s2idle-mocs.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@xe_sriov=
_auto_provisioning@fair-allocation@numvfs-random.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v=
1/shard-bmg-5/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_big_=
fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms=
_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_bw@l=
inear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/=
shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard=
-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_ccs@=
crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/sh=
ard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/ig=
t@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_cham=
elium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/i=
gt@kms_chamelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_cont=
ent_protection@legacy-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE=
#7374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-163562v1/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194">In=
tel XE#7194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-1/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-7/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-b=
mg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-4/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@kms_fli=
p_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">=
Intel XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32=
bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v=
1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-163562v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard=
-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163562v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1635=
62v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1635=
62v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Inte=
l XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-163562v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
3562v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163562v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#=
7443</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163562v1/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-4/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-2/igt@kms_plan=
e@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel =
XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-163562v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modif=
ier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-4/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel X=
E#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-9/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2=
/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE=
#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163562v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1635=
62v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-6/igt@kms_psr@=
fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-b=
mg-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#73=
42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
3562v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-3/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#=
7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163562v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Inte=
l XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7342">Intel XE#7342</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-1/igt@xe_eudeb=
ug@discovery-race-sigint.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_eud=
ebug@discovery-race-sigint.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@xe_eude=
bug_online@tdctl-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard=
-bmg-2/igt@xe_eudebug_online@tdctl-parameters.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-9/igt@xe_evict=
@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-=
2/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueu=
es-many-vm-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@xe_exec=
_fault_mode@many-multi-queue-rebind-imm.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-b=
mg-2/igt@xe_exec_fault_mode@many-multi-queue-rebind-imm.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-9/igt@xe_exec_=
multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Inte=
l XE#6874</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-163562v1/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-=
fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind-err:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-4/igt@xe_exec_=
threads@threads-multi-queue-rebind-err.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bm=
g-2/igt@xe_exec_threads@threads-multi-queue-rebind-err.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/i=
gt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-8/igt@xe_pxp@p=
xp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/sha=
rd-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-10/igt@xe_quer=
y@multigpu-query-invalid-size.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@xe_=
query@multigpu-query-invalid-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a/shard-bmg-5/igt@xe_wedge=
d@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163562v1/shard-bmg-2/igt@x=
e_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8811 -&gt; IGT_8813</li>
<li>Linux: xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a -&gt; xe-pw-163=
562v1</li>
</ul>
<p>IGT_8811: cc3169e72592a56b806ce54a87060519151ad5fe @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8813: 89e32100ca0e4ca343dd32408dacf1e879e8ed02 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a: 4ae9f18564e78a5447be68a=
a1e9232a4f2c37b5a<br />
  xe-pw-163562v1: 163562v1</p>

</body>
</html>

--===============5643599141714332500==--
