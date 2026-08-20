Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E0FC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 01:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E640310E5C2;
	Thu, 20 Aug 2026 01:38:22 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BD710E10F;
 Thu, 20 Aug 2026 01:38:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2974145542273319090=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Convert_IO=5FBUS?=
 =?utf-8?q?_errors_to_structured_xe=5Flog_API?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Aug 2026 01:38:21 -0000
Message-ID: <178718990173.69182.971390254714696501@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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

--===============2974145542273319090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Convert IO_BUS errors to structured xe_log API
URL   : https://patchwork.freedesktop.org/series/172475/
State : failure

== Summary ==

CI Bug Log - changes from xe-5618-b083c821521cb941e9838665d205fe76943a0b66_FULL -> xe-pw-172475v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172475v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172475v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172475v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_pm_rpm@i2c.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html

  
#### Warnings ####

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          [FAIL][3] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [DMESG-FAIL][4] +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_content_protection@srm@pipe-a-dp-2.html

  
Known issues
------------

  Here are the changes found in xe-pw-172475v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [PASS][5] -> [ABORT][6] ([Intel XE#8007])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-6/igt@core_hotunplug@hotunbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#3718] / [Intel XE#6078])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#6078])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7059] / [Intel XE#7085])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-lnl:          [PASS][13] -> [ABORT][14] ([Intel XE#4760])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#607] / [Intel XE#7361]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#610] / [Intel XE#7387])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +9 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2724] / [Intel XE#7449])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2325] / [Intel XE#7358])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#6969]) +10 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6974])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2321] / [Intel XE#7355])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1340] / [Intel XE#7435])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#8265]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4156] / [Intel XE#7425])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2372] / [Intel XE#7359])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2375])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-bmg:          [PASS][36] -> [DMESG-FAIL][37] ([Intel XE#7774]) +1 other test dmesg-fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7061]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#4141]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2311]) +38 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7061] / [Intel XE#7356])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2350] / [Intel XE#7503])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2313]) +42 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#6901])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#8348])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#8303]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7283]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2505] / [Intel XE#7447])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1489]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#6503]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1499])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_vrr@max-min.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-bmg:          NOTRUN -> [ABORT][57] ([Intel XE#8868])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#6599])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_compute@eu-busy-10s.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#8608])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-cm-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#8370])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@xe_evict@evict-cm-threads-small-multi-queue.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][61] -> [INCOMPLETE][62] ([Intel XE#6321] / [Intel XE#8355])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8374]) +9 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#8364]) +20 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-basic-smem.html

  * igt@xe_exec_reset@multi-queue-cancel-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#8369]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#8589]) +117 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8378]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#6964]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7793])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7590])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#944]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][74] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][75] +3 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][76] ([Intel XE#1503]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@xe_survivability@i2c-functionality:
    - shard-bmg:          [ABORT][78] ([Intel XE#8007]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-7/igt@xe_survivability@i2c-functionality.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@xe_survivability@i2c-functionality.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][80] ([Intel XE#1124]) -> [SKIP][81] ([Intel XE#8589]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][82] ([Intel XE#2887]) -> [SKIP][83] ([Intel XE#8589]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][84] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][85] ([Intel XE#8589])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][86] ([Intel XE#2252]) -> [SKIP][87] ([Intel XE#8589]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-bmg:          [SKIP][88] ([Intel XE#2320]) -> [SKIP][89] ([Intel XE#8589]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][90] ([Intel XE#7571]) -> [SKIP][91] ([Intel XE#8589])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][92] ([Intel XE#8265]) -> [SKIP][93] ([Intel XE#8589]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][94] ([Intel XE#4141]) -> [SKIP][95] ([Intel XE#8589]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][96] ([Intel XE#2311]) -> [SKIP][97] ([Intel XE#8589]) +9 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][98] ([Intel XE#2313]) -> [SKIP][99] ([Intel XE#8589]) +9 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][100] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][101] ([Intel XE#8589])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][102] ([Intel XE#7061]) -> [SKIP][103] ([Intel XE#8589])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          [SKIP][104] ([Intel XE#7283]) -> [SKIP][105] ([Intel XE#8589]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][106] ([Intel XE#1489]) -> [SKIP][107] ([Intel XE#8589])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][108] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][109] ([Intel XE#8589])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          [SKIP][110] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][111] ([Intel XE#8589]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_psr@psr-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_psr@psr-suspend.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][112] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][113] ([Intel XE#2509] / [Intel XE#7437])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][114] ([Intel XE#8370]) -> [SKIP][115] ([Intel XE#8589])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-cm.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          [SKIP][116] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][117] ([Intel XE#8589])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-null.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
    - shard-bmg:          [SKIP][118] ([Intel XE#8374]) -> [SKIP][119] ([Intel XE#8589])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
    - shard-bmg:          [SKIP][120] ([Intel XE#8364]) -> [SKIP][121] ([Intel XE#8589]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-close-fd:
    - shard-bmg:          [SKIP][122] ([Intel XE#8369]) -> [SKIP][123] ([Intel XE#8589])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-close-fd.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-close-fd.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [INCOMPLETE][124] ([Intel XE#7098] / [Intel XE#8159]) -> [SKIP][125] ([Intel XE#8589])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:
    - shard-bmg:          [SKIP][126] ([Intel XE#8378]) -> [SKIP][127] ([Intel XE#8589]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][128] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][129] ([Intel XE#8589])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          [SKIP][130] ([Intel XE#944]) -> [SKIP][131] ([Intel XE#8589])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_query@multigpu-query-gt-list.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][132] ([Intel XE#8966]) -> [ABORT][133] ([Intel XE#8007])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-9/igt@xe_survivability@runtime-survivability.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-1/igt@xe_survivability@runtime-survivability.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8966
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5618-b083c821521cb941e9838665d205fe76943a0b66 -> xe-pw-172475v1

  IGT_9063: 9063
  xe-5618-b083c821521cb941e9838665d205fe76943a0b66: b083c821521cb941e9838665d205fe76943a0b66
  xe-pw-172475v1: 172475v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/index.html

--===============2974145542273319090==
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
<tr><td><b>Series:</b></td><td>drm/xe: Convert IO_BUS errors to structured xe_log API</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172475/">https://patchwork.freedesktop.org/series/172475/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5618-b083c821521cb941e9838665d205fe76943a0b66_FULL -&gt; xe-pw-172475v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172475v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-172475v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-172475v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_rpm@i2c:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_pm_rpm@i2c.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@srm@pipe-a-dp-2:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_content_protection@srm@pipe-a-dp-2.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172475v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-6/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@xe_evict@evict-cm-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-2/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +117 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-7/igt@xe_survivability@i2c-functionality.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@xe_survivability@i2c-functionality.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-4/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5618-b083c821521cb941e9838665d205fe76943a0b66/shard-bmg-9/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8966">Intel XE#8966</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v1/shard-bmg-1/igt@xe_survivability@runtime-survivability.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5618-b083c821521cb941e9838665d205fe76943a0b66 -&gt; xe-pw-172475v1</li>
</ul>
<p>IGT_9063: 9063<br />
  xe-5618-b083c821521cb941e9838665d205fe76943a0b66: b083c821521cb941e9838665d205fe76943a0b66<br />
  xe-pw-172475v1: 172475v1</p>

</body>
</html>

--===============2974145542273319090==--
