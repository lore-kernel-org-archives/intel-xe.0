Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF33E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 11:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598F010E2A4;
	Thu, 19 Feb 2026 11:46:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A424510E012;
 Thu, 19 Feb 2026 11:46:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8957672047693274869=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_PXP_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Feb 2026 11:46:38 -0000
Message-ID: <177150159864.265880.8585709945035136590@a3b018990fe9>
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

--===============8957672047693274869==
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
    - shard-bmg:          [PASS][1] -> ([PASS][2], [DMESG-WARN][3])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> ([SKIP][5], [SKIP][6]) +1 other test ( 2 skip )
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [PASS][7] -> ([PASS][8], [FAIL][9]) +1 other test ( 1 fail, 1 pass )
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_live_ktest@xe_dma_buf.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  
Known issues
------------

  Here are the changes found in xe-pw-161800v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> ([SKIP][12], [SKIP][13]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2328])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1428])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#610])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2314] / [Intel XE#2894])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][19], [SKIP][20]) ([Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2887])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#3432])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][25], [SKIP][26]) ([Intel XE#2887]) +1 other test ( 2 skip )
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][27], [SKIP][28]) ([Intel XE#2652] / [Intel XE#787]) +8 other tests ( 2 skip )
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> ([SKIP][29], [SKIP][30]) ([Intel XE#2325])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_chamelium_color@gamma.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#2252]) +3 other tests ( 2 skip )
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2252]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#1178] / [Intel XE#3304]) +3 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][35] ([Intel XE#3304]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          NOTRUN -> ([SKIP][36], [SKIP][37]) ([Intel XE#6974])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#3278])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#6707]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2320]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1424])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> ([SKIP][42], [SKIP][43]) ([Intel XE#2320])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#309])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][45] -> ([FAIL][46], [PASS][47]) ([Intel XE#5299])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2286])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1508])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4210])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_flip@2x-flip-vs-panning@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][51] -> ([ABORT][52], [PASS][53]) ([Intel XE#5545] / [Intel XE#6652]) +1 other test ( 1 abort, 1 pass )
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning@cd-dp2-hdmi-a3.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning@cd-dp2-hdmi-a3.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning@cd-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][54], [SKIP][55]) ([Intel XE#7178])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7179])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7061]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7061])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([Intel XE#4141]) +1 other test ( 2 skip )
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4141]) +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2311]) +10 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][63], [SKIP][64]) ([Intel XE#2311]) +5 other tests ( 2 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#651])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> ([SKIP][66], [SKIP][67]) ([Intel XE#2352])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2313]) +14 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#656]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][70], [SKIP][71]) ([Intel XE#2313]) +5 other tests ( 2 skip )
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][72], [SKIP][73]) ([Intel XE#7061]) +2 other tests ( 2 skip )
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#4090])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-bmg:          NOTRUN -> ([PASS][75], [ABORT][76]) ([Intel XE#5545]) +1 other test ( 1 abort, 1 pass )
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_plane_cursor@primary.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> ([SKIP][77], [SKIP][78]) ([Intel XE#6886]) +9 other tests ( 2 skip )
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([Intel XE#870])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_pm_backlight@fade.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2391])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][82] -> ([PASS][83], [SKIP][84]) ([Intel XE#6693]) +1 other test ( 1 pass, 1 skip )
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_pm_rpm@drm-resources-equal.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1439] / [Intel XE#3141])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][86], [SKIP][87]) ([Intel XE#1406] / [Intel XE#1489]) +1 other test ( 2 skip )
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#1406] / [Intel XE#1489])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1406] / [Intel XE#2387])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1406])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-bmg:          NOTRUN -> ([SKIP][91], [SKIP][92]) ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests ( 2 skip )
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr@psr-dpms.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#1406] / [Intel XE#2414])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#6503])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][98] -> ([FAIL][99], [PASS][100]) ([Intel XE#4459]) +1 other test ( 1 fail, 1 pass )
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#1499]) +1 other test ( 2 skip )
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#6599])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_compute@eu-busy-10s.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> ([SKIP][104], [SKIP][105]) ([Intel XE#4837]) +1 other test ( 2 skip )
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_eudebug@basic-read-event.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#4837]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-discovery.html
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#4837])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#6665])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_eudebug_online@pagefault-one-of-many.html
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#6665])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#4837] / [Intel XE#6665])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#6665] / [Intel XE#6681])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#4518])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#5793])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#688]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_evict@evict-mixed-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-external-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#7140])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_evict@evict-small-external-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2322]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> ([SKIP][117], [SKIP][118]) ([Intel XE#2322])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1392])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> ([SKIP][120], [SKIP][121]) ([Intel XE#7136]) +1 other test ( 2 skip )
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-imm:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#7136]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#7136]) +7 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#6874]) +11 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - shard-bmg:          NOTRUN -> ([SKIP][125], [SKIP][126]) ([Intel XE#6874]) +6 other tests ( 2 skip )
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-basic-smem.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#6874]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset:
    - shard-bmg:          [PASS][128] -> ([PASS][129], [SKIP][130]) ([Intel XE#6703]) +152 other tests ( 1 pass, 1 skip )
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-new-nomemset:
    - shard-bmg:          [PASS][131] -> ([PASS][132], [SKIP][133]) ([Intel XE#6557] / [Intel XE#6703])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          NOTRUN -> ([SKIP][134], [SKIP][135]) ([Intel XE#7138])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#7138])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#7138]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161]) -> ([PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [SKIP][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207]) ([Intel XE#2457])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-6/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-9/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-9/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-6/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-8/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#6964]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#5742])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#4733]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> ([SKIP][211], [SKIP][212]) ([Intel XE#944])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_query@multigpu-query-pxp-status.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][213] ([Intel XE#5993]) -> ([PASS][214], [PASS][215]) +3 other tests ( 2 pass )
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][216] ([Intel XE#6715]) -> ([PASS][217], [PASS][218])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][219] ([Intel XE#301] / [Intel XE#3149]) -> ([PASS][220], [PASS][221]) +1 other test ( 2 pass )
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][222] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][223] +1 other test pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault:
    - shard-bmg:          [FAIL][224] ([Intel XE#5625]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][226] ([Intel XE#2370]) -> ([SKIP][227], [SKIP][228]) ([Intel XE#2370] / [Intel XE#6703])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][229] ([Intel XE#1124]) -> ([SKIP][230], [SKIP][231]) ([Intel XE#1124] / [Intel XE#6703]) +2 other tests ( 2 skip )
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][232] ([Intel XE#2314] / [Intel XE#2894]) -> ([SKIP][233], [SKIP][234]) ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#6703])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][235] ([Intel XE#2887]) -> ([SKIP][236], [SKIP][237]) ([Intel XE#2887] / [Intel XE#6703]) +4 other tests ( 2 skip )
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-bmg:          [SKIP][238] ([Intel XE#2252]) -> ([SKIP][239], [SKIP][240]) ([Intel XE#2252] / [Intel XE#6703]) +1 other test ( 2 skip )
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-multiple.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_chamelium_frames@dp-crc-multiple.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][241] ([Intel XE#6507]) -> ([SKIP][242], [SKIP][243]) ([Intel XE#6507] / [Intel XE#6703])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][244] ([Intel XE#1178] / [Intel XE#3304]) -> ([FAIL][245], [SKIP][246]) ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#6703])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_content_protection@atomic-dpms.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][247] ([Intel XE#2390] / [Intel XE#6974]) -> ([SKIP][248], [SKIP][249]) ([Intel XE#2390] / [Intel XE#6703] / [Intel XE#6974])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][250] ([Intel XE#1508]) -> ([SKIP][251], [SKIP][252]) ([Intel XE#1508] / [Intel XE#6703])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][253] ([Intel XE#2311]) -> ([SKIP][254], [SKIP][255]) ([Intel XE#2311] / [Intel XE#6703]) +7 other tests ( 2 skip )
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][256] ([Intel XE#4141]) -> ([SKIP][257], [SKIP][258]) ([Intel XE#4141] / [Intel XE#6703]) +2 other tests ( 2 skip )
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          [SKIP][259] ([Intel XE#2313]) -> ([SKIP][260], [SKIP][261]) ([Intel XE#2313] / [Intel XE#6703]) +7 other tests ( 2 skip )
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][262] ([Intel XE#7061]) -> ([SKIP][263], [SKIP][264]) ([Intel XE#6703] / [Intel XE#7061])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][265] ([Intel XE#5021]) -> ([SKIP][266], [SKIP][267]) ([Intel XE#5021] / [Intel XE#6703])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][268] ([Intel XE#1406] / [Intel XE#1489]) -> ([SKIP][269], [SKIP][270]) ([Intel XE#1406] / [Intel XE#1489] / [Intel XE#6703]) +1 other test ( 2 skip )
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-bmg:          [SKIP][271] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> ([SKIP][272], [SKIP][273]) ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850] / [Intel XE#6703]) +2 other tests ( 2 skip )
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_psr@pr-sprite-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_psr@pr-sprite-blt.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][274] ([Intel XE#1406] / [Intel XE#2414]) -> ([SKIP][275], [SKIP][276]) ([Intel XE#1406] / [Intel XE#2414] / [Intel XE#6703])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][277] ([Intel XE#3414] / [Intel XE#3904]) -> ([SKIP][278], [SKIP][279]) ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#6703]) +1 other test ( 2 skip )
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][280] ([Intel XE#6503]) -> ([SKIP][281], [SKIP][282]) ([Intel XE#6503] / [Intel XE#6703])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][283] ([Intel XE#2426]) -> ([FAIL][284], [FAIL][285]) ([Intel XE#1729])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][286] ([Intel XE#2509]) -> ([SKIP][287], [SKIP][288]) ([Intel XE#2426])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          [SKIP][289] ([Intel XE#4837]) -> ([SKIP][290], [SKIP][291]) ([Intel XE#4837] / [Intel XE#6703]) +2 other tests ( 2 skip )
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_eudebug@vm-bind-clear.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_eudebug@vm-bind-clear.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          [SKIP][292] ([Intel XE#4837] / [Intel XE#6665]) -> ([SKIP][293], [SKIP][294]) ([Intel XE#4837] / [Intel XE#6665] / [Intel XE#6703])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-bmg:          [SKIP][295] ([Intel XE#2322]) -> ([SKIP][296], [SKIP][297]) ([Intel XE#2322] / [Intel XE#6703]) +2 other tests ( 2 skip )
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue:
    - shard-bmg:          [SKIP][298] ([Intel XE#7136]) -> ([SKIP][299], [SKIP][300]) ([Intel XE#6703] / [Intel XE#7136]) +2 other tests ( 2 skip )
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][301] ([Intel XE#6874]) -> ([SKIP][302], [SKIP][303]) ([Intel XE#6703] / [Intel XE#6874]) +6 other tests ( 2 skip )
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          [SKIP][304] ([Intel XE#7138]) -> ([SKIP][305], [SKIP][306]) ([Intel XE#6703] / [Intel XE#7138]) +2 other tests ( 2 skip )
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][307] ([Intel XE#944]) -> ([SKIP][308], [SKIP][309]) ([Intel XE#6703] / [Intel XE#944])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_query@multigpu-query-invalid-extension.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html

  
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
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
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

--===============8957672047693274869==
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
@2x-flip-vs-panning@bd-dp2-hdmi-a3.html">PASS</a> -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_flip@=
2x-flip-vs-panning@bd-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_flip@2x-flip=
-vs-panning@bd-dp2-hdmi-a3.html">DMESG-WARN</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tile=
d-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_plane@pixel-format-y-til=
ed-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_plane=
@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a>)=
 +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_live_=
ktest@xe_dma_buf.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_live_ktest@xe_dma_buf.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
61800v1/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a>) +1 other t=
est ( 1 fail, 1 pass )</li>
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
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-ro=
tate-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-161800v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1124">Intel XE#1124</a>) +2 other tests ( 2 skip )</li>
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
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displ=
ays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-256=
0x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-d-dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
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
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs@pipe-c-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-=
tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_chamelium_color@gamma.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
1800v1/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-c=
hange-during-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-=
change-during-hibernate.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</l=
i>
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
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_content_protection@dp-ms=
t-type-1-suspend-resume.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_content_protection@dp-=
mst-type-1-suspend-resume.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
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
ernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
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
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_cursor_crc@cursor-slidin=
g-32x10.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-161800v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x10.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
320">Intel XE#2320</a>)</li>
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
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_cursor_l=
egacy@flip-vs-cursor-legacy.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_cursor_legacy@flip=
-vs-cursor-legacy.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
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
@2x-flip-vs-panning@cd-dp2-hdmi-a3.html">PASS</a> -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_flip@=
2x-flip-vs-panning@cd-dp2-hdmi-a3.html">ABORT</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_flip@2x-fli=
p-vs-panning@cd-dp2-hdmi-a3.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) +1 =
other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">In=
tel XE#7178</a>)</li>
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
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
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
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_track=
ing@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other =
test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)=
 +5 other tests ( 2 skip )</li>
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
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc=
psr-tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-tilin=
g-y.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests s=
kip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr=
-argb161616f-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_frontbuffer_tracking=
@psr-argb161616f-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests =
( 2 skip )</li>
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
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_plane_cursor@primary.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
800v1/shard-bmg-2/igt@kms_plane_cursor@primary.html">ABORT</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a=
>) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-5.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_plane_sc=
aling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6=
886</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@kms_pm_backlight@fade.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800=
v1/shard-bmg-8/igt@kms_pm_backlight@fade.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
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
pm@drm-resources-equal.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_pm_rpm@drm-resou=
rces-equal.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/669=
3">Intel XE#6693</a>) +1 other test ( 1 pass, 1 skip )</li>
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
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-curs=
or-plane-move-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 =
other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
</li>
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
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr@psr-dpms.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/sh=
ard-bmg-7/igt@kms_psr@psr-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel=
 XE#2850</a>) +3 other tests ( 2 skip )</li>
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
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@kms_psr_stress_test@flip-p=
rimary-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
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
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-161800v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
161800v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459=
</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-d=
rrs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-161800v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) +1 other test ( 2 skip )</li>
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
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_eudebug@basic-read-event.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
161800v1/shard-bmg-2/igt@xe_eudebug@basic-read-event.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#48=
37</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-disc=
overy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
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
//gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-ex=
ec-userptr-invalidate-race.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_exec_basic@multigpu-=
no-exec-userptr-invalidate-race.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
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
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_exec_fault_mode@many-exec=
queues-multi-queue-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_exec_fault_mode@many=
-execqueues-multi-queue-userptr.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test=
 ( 2 skip )</li>
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
rm/xe/kernel/issues/7136">Intel XE#7136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@xe_exec_multi_queue@many-que=
ues-basic-smem.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-bas=
ic-smem.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6874">Intel XE#6874</a>) +6 other tests ( 2 skip )</li>
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
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/sh=
ard-bmg-10/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nom=
emset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-161800v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mma=
p-file-mlock-nomemset.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +152 other tests ( 1 pa=
ss, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
system_allocator@process-many-large-new-nomemset.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1=
0/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/sha=
rd-bmg-2/igt@xe_exec_system_allocator@process-many-large-new-nomemset.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_exec_threads@threads-mult=
i-queue-cm-fd-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_exec_threads@threads-mult=
i-queue-cm-fd-userptr.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
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
lab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +5 other =
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
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-161800v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16180=
0v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16180=
0v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-1=
0/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1618=
00v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161800v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
800v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_modul=
e_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
800v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
1800v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-161800v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
61800v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-161800v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
61800v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-161800v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
61800v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
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
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@xe_query@multigpu-query-pxp-=
status.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-161800v1/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944=
">Intel XE#944</a>)</li>
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
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v=
1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
61800v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-li=
near.html">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-7/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-8/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a>)</li>
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
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
800v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v=
1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS<=
/a>) +1 other test ( 2 pass )</li>
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
XE#2370</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-161800v1/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-internal-panels.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_atomic_transition@plane-=
all-modeset-transition-internal-panels.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@k=
ms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_big_fb@yf=
-tiled-16bpp-rotate-180.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 othe=
r tests ( 2 skip )</li>
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
XE#2894</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-161800v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-216=
0x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-161800v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-=
2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_ccs@=
bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard=
-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-=
bmg-10/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Inte=
l XE#2887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_cham=
elium_frames@dp-crc-multiple.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@=
kms_chamelium_frames@dp-crc-multiple.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_chamelium=
_frames@dp-crc-multiple.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2252">Intel XE#2252</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 othe=
r test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_cham=
elium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-=
2/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/i=
gt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>)</li>
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
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard=
-bmg-10/igt@kms_content_protection@atomic-dpms.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms=
_content_protection@atomic-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>)</li>
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
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/sha=
rd-bmg-10/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/ig=
t@kms_content_protection@dp-mst-type-1.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/697=
4">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_dir=
tyfb@psr-dirtyfb-ioctl.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioc=
tl.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1508">Intel XE#1508</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-161800v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-in=
dfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-161800v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
+7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/s=
hard-bmg-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v=
1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_pl=
ane_multiple@2x-tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_plane_multiple@2x-til=
ing-y.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
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
l XE#1489</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-161800v1/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous=
-exceed-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-161800v1/shard-bmg-10/igt@kms_psr2_sf@pr-overlay-plane-move-cont=
inuous-exceed-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
+1 other test ( 2 skip )</li>
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
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shar=
d-bmg-10/igt@kms_psr@pr-sprite-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_psr@pr-spri=
te-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +2 other tests ( 2 skip )</li>
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
E#2414</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-161800v1/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-ove=
rlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-161800v1/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
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
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
800v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v=
1/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"=
>Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_shar=
pness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-b=
mg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-=
10/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6=
503</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-6/igt@k=
ms_tiled_display@basic-test-pattern.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@kms_tiled_disp=
lay@basic-test-pattern.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@kms_til=
ed_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/s=
hard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1=
/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_eudeb=
ug@vm-bind-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_eudebug@vm=
-bind-clear.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_eudebug@vm-bind-clear.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">I=
ntel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6703">Intel XE#6703</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_eudeb=
ug_online@set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-b=
mg-2/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/igt@xe_eude=
bug_online@set-breakpoint.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-=
2/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/i=
gt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-b=
mg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg=
-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/71=
36">Intel XE#7136</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-fault-priority.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161=
800v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-prio=
rity.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-161800v1/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-f=
ault-priority.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests ( =
2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_=
threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v=
1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
61800v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-r=
ebind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_query=
@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-10/i=
gt@xe_query@multigpu-query-invalid-extension.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161800v1/shard-bmg-2/igt@xe_qu=
ery@multigpu-query-invalid-extension.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</=
a>)</li>
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

--===============8957672047693274869==--
