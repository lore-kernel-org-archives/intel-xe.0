Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2D3E9A02C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 02:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D07110E654;
	Thu, 19 Feb 2026 02:56:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DADC10E19D;
 Thu, 19 Feb 2026 02:56:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7281473190237373275=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_PXP_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Feb 2026 02:56:38 -0000
Message-ID: <177146979809.264666.16424938793917735538@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
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

--===============7281473190237373275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: PXP fixes
URL   : https://patchwork.freedesktop.org/series/161800/
State : failure

== Summary ==

CI Bug Log - changes from xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857_FULL -> xe-pw-161800v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161800v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161800v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161800v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][3] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [PASS][4] -> [FAIL][5] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  
Known issues
------------

  Here are the changes found in xe-pw-161800v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +8 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2328])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1428])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#610])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2314] / [Intel XE#2894])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#3432])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2325])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#1178] / [Intel XE#3304]) +3 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#3304]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#6974])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#3278])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#6707]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2320]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1424])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#309])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2286])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1508])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4210])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_flip@2x-flip-vs-panning@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][31] -> [ABORT][32] ([Intel XE#5545] / [Intel XE#6652]) +1 other test abort
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning@cd-dp2-hdmi-a3.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning@cd-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7178])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7179])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7061])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4141]) +10 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2311]) +16 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#651])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2352])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2313]) +20 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#656]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7061]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4090])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6886]) +9 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#870])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2391])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#6693]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1439] / [Intel XE#3141])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#2387])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1406])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#1406] / [Intel XE#2414])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#6503])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#4459]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1499]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#6599])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_compute@eu-busy-10s.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4837]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#4837])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#6665])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_eudebug_online@pagefault-one-of-many.html
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6665])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4837] / [Intel XE#6665])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6665] / [Intel XE#6681])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4518])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#5793])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#688]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_evict@evict-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-external-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#7140])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_evict@evict-small-external-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2322]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1392])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-imm:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7136]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#7136]) +9 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#6874]) +18 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#6874]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#6703]) +152 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-new-nomemset:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#6557] / [Intel XE#6703])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7138])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7138]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106]) -> ([PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [SKIP][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132]) ([Intel XE#2457])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-6/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-8/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-9/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-9/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-6/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-8/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#6964]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#5742])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#4733]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#944])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_query@multigpu-query-pxp-status.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][137] ([Intel XE#5993]) -> [PASS][138] +3 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][139] ([Intel XE#6715]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][141] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][143] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault:
    - shard-bmg:          [FAIL][145] ([Intel XE#5625]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][147] ([Intel XE#2370]) -> [SKIP][148] ([Intel XE#6703])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][149] ([Intel XE#1124]) -> [SKIP][150] ([Intel XE#6703]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][151] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][152] ([Intel XE#6703])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][153] ([Intel XE#2887]) -> [SKIP][154] ([Intel XE#6703]) +4 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-bmg:          [SKIP][155] ([Intel XE#2252]) -> [SKIP][156] ([Intel XE#6703]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-multiple.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][157] ([Intel XE#6507]) -> [SKIP][158] ([Intel XE#6703])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][159] ([Intel XE#1178] / [Intel XE#3304]) -> [SKIP][160] ([Intel XE#6703])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][161] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][162] ([Intel XE#6703])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][163] ([Intel XE#1508]) -> [SKIP][164] ([Intel XE#6703])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][165] ([Intel XE#2311]) -> [SKIP][166] ([Intel XE#6703]) +7 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][167] ([Intel XE#4141]) -> [SKIP][168] ([Intel XE#6703]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          [SKIP][169] ([Intel XE#2313]) -> [SKIP][170] ([Intel XE#6703]) +7 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][171] ([Intel XE#7061]) -> [SKIP][172] ([Intel XE#6703])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][173] ([Intel XE#5021]) -> [SKIP][174] ([Intel XE#6703])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][175] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][176] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-bmg:          [SKIP][177] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][178] ([Intel XE#1406] / [Intel XE#6703]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_psr@pr-sprite-blt.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][179] ([Intel XE#1406] / [Intel XE#2414]) -> [SKIP][180] ([Intel XE#1406] / [Intel XE#6703])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][181] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][182] ([Intel XE#6703]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][183] ([Intel XE#6503]) -> [SKIP][184] ([Intel XE#6703])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][185] ([Intel XE#2426]) -> [FAIL][186] ([Intel XE#1729])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][187] ([Intel XE#2509]) -> [SKIP][188] ([Intel XE#2426])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          [SKIP][189] ([Intel XE#4837]) -> [SKIP][190] ([Intel XE#6703]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_eudebug@vm-bind-clear.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          [SKIP][191] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][192] ([Intel XE#6703])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-bmg:          [SKIP][193] ([Intel XE#2322]) -> [SKIP][194] ([Intel XE#6703]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue:
    - shard-bmg:          [SKIP][195] ([Intel XE#7136]) -> [SKIP][196] ([Intel XE#6703]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][197] ([Intel XE#6874]) -> [SKIP][198] ([Intel XE#6703]) +6 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          [SKIP][199] ([Intel XE#7138]) -> [SKIP][200] ([Intel XE#6703]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][201] ([Intel XE#944]) -> [SKIP][202] ([Intel XE#6703])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857 -> xe-pw-161800v1

  IGT_8760: 8760
  xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857: e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857
  xe-pw-161800v1: 161800v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/index.html

--===============7281473190237373275==
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
<tr><td><b>Series:</b></td><td>drm/xe: PXP fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/161800/">https://patchwork.freedesktop.org/series/161800/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-161800v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-161800v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde=
9d61857_FULL -&gt; xe-pw-161800v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161800v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-161800v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1618=
00v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-panning@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_flip@2=
x-flip-vs-panning@bd-dp2-hdmi-a3.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tile=
d-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_live_=
ktest@xe_dma_buf.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.htm=
l">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161800v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1428">Intel XE#1428</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_content_protection@atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3304">Intel XE#3304</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@kms_content_protection@atomic=
-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_content_protection@dp-mst=
-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_content_protection@srm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_content_protection@uevent=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6707">Intel XE#6707</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-panning@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_flip@2=
x-flip-vs-panning@cd-dp2-hdmi-a3.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>=
) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-p016=
-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests s=
kip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_pm_r=
pm@drm-resources-equal.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_pm_rpm@drm-resourc=
es-equal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6693">Intel XE#6693</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_psr@fbc-pr-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_psr@psr2-primary-page-fli=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_sharpness_filter@filter-t=
oggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-6/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-161800v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_compute@eu-busy-10s.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
99">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_eudebug@basic-read-event.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-disc=
overy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_eudebug_online@pagefault-o=
ne-of-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6665">Intel XE#6665</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_eudebug_online@pagefault-o=
ne-of-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_eudebug_online@pagefault-r=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_eudebug_online@pagefault-r=
ead-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6665">Intel XE#6665</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4518">Intel XE#4518</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_evict@evict-mixed-threads-=
large-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_evict@evict-small-external=
-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-ra=
ce-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7136">Intel XE#7136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +18 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-fault-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
system_allocator@many-execqueues-mmap-file-mlock-nomemset.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/sha=
rd-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomem=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +152 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
system_allocator@process-many-large-new-nomemset.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/=
igt@xe_exec_system_allocator@process-many-large-new-nomemset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Inte=
l XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_threads@threads-multi=
-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_exec_threads@threads-multi=
-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d6=
1857/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dd=
e9d61857/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1f=
b0dde9d61857/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c9782=
9d1fb0dde9d61857/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c=
97829d1fb0dde9d61857/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b=
2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b9=
9e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6=
a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e103=
2fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-=
e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bm=
g-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shar=
d-bmg-8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-161800v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16180=
0v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16180=
0v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16180=
0v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1=
0/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1618=
00v1/shard-bmg-7/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1618=
00v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherenc=
y-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_pm@d3hot-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Int=
el XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_pxp@pxp-optout.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">I=
ntel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-2/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1=
/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.ht=
ml">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1618=
00v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend@c-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/=
shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
system_allocator@partial-atomic-middle-remap-no-cpu-fault.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel X=
E#5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-161800v1/shard-bmg-4/igt@xe_exec_system_allocator@partial-atomic-middle-r=
emap-no-cpu-fault.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel =
XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-161800v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@km=
s_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-161800v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_ccs@=
bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-=
bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_cham=
elium_frames@dp-crc-multiple.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@km=
s_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_cham=
elium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2=
/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-=
bmg-2/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shar=
d-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/sh=
ard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Inte=
l XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-161800v1/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-=
exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_psr@=
pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard=
-bmg-2/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel X=
E#2414</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-161800v1/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-over=
lay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_rota=
tion_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1618=
00v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_shar=
pness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bm=
g-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@kms_til=
ed_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/sh=
ard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426"=
>Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_eudeb=
ug@vm-bind-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_eudebug@vm-=
bind-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_eudeb=
ug_online@set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bm=
g-2/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2=
/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bm=
g-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-fault-priority.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1618=
00v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-prior=
ity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1=
/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_query=
@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/ig=
t@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</l=
i>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857 -&gt; xe-pw-161=
800v1</li>
</ul>
<p>IGT_8760: 8760<br />
  xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857: e1032fc6a7b99e9b2c4c978=
29d1fb0dde9d61857<br />
  xe-pw-161800v1: 161800v1</p>

</body>
</html>

--===============7281473190237373275==--
