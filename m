Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0C9CCA464
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 10:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A17D112734;
	Fri, 16 Oct 2026 10:15:23 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F0D112738;
 Fri, 16 Oct 2026 10:15:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3493091456829283357=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Add_a_minimum_ag?=
 =?utf-8?q?e_gate_to_the_shrinker?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 10:15:22 -0000
Message-ID: <179214572239.34805.9183254064272962108@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261015231733.624746-1-matthew.brost@intel.com>
In-Reply-To: <20261015231733.624746-1-matthew.brost@intel.com>
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

--===============3493091456829283357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add a minimum age gate to the shrinker
URL   : https://patchwork.freedesktop.org/series/176251/
State : success

== Summary ==

CI Bug Log - changes from xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67_FULL -> xe-pw-176251v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-176251v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-ptl:          NOTRUN -> [SKIP][1] ([Intel XE#7225])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#3658] / [Intel XE#7360])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5901]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#7085])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1467] / [Intel XE#7367])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5808]) +8 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#7679]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#367]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#3432])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5822]) +15 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5824]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7358]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#8391])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#2252]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#373]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#6969]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#7642])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#3304] / [Intel XE#7374])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#6974])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7642])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1424])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#5846])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#5900]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-ptl:          [PASS][28] -> [ABORT][29] ([Intel XE#9375]) +1 other test abort
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#309] / [Intel XE#7343]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5962]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#5962] / [Intel XE#7343])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#9531])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#9535])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#5907])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#8265])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#703] / [Intel XE#7448])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1421])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#2316]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][40] ([Intel XE#301]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#7179]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#5828]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#7178]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#5800] / [Intel XE#6312]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#6312]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#5812]) +56 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2311])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#6312]) +12 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#7865]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7905]) +16 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7061] / [Intel XE#7356])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#7061] / [Intel XE#7356])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#7061]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#7399])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#7865]) +18 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#656] / [Intel XE#7905]) +11 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7061]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#6901])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#6900] / [Intel XE#7362])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7591])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#6912])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#7283]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [FAIL][65] ([Intel XE#9340]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#8303]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#7283]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#5844]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#599])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#6886]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-lnl:          NOTRUN -> [FAIL][72] ([Intel XE#8399])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_rpm@package-g7:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#6813])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#2893] / [Intel XE#7304])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#4608])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#4608] / [Intel XE#7304])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#7304]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#7413])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1406] / [Intel XE#7345])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-dpms@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms@edp-1.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1406])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#5813])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#5821])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1499] / [Intel XE#9271])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-ptl:          NOTRUN -> [ABORT][86] ([Intel XE#8868])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-4/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_ccs@suspend-resume:
    - shard-ptl:          NOTRUN -> [ABORT][87] ([Intel XE#9362]) +1 other test abort
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#7644])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#5191])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#5764]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-ptl:          NOTRUN -> [SKIP][91] ([Intel XE#6144])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_balancer@many-cm-virtual-basic:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#7482]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_exec_balancer@many-cm-virtual-basic.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#7482]) +11 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1392]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#5575] / [Intel XE#7484]) +6 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#8374]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#8374]) +8 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-queues-dyn-priority:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#8364])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-dyn-priority.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#8364]) +8 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#8364]) +18 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#8369])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-ptl:          NOTRUN -> [SKIP][103] ([Intel XE#8369])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#6196])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-bmg:          [PASS][105] -> [FAIL][106] ([Intel XE#9096])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-10/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#8378]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-cm-basic.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#8378]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#8378])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#7954])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_madvise@atomic-device:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#7980])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_madvise@atomic-device.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#5100] / [Intel XE#7408])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_mmap@small-bar:
    - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#5867])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#6964])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#7793])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@pat-index-xelp:
    - shard-ptl:          NOTRUN -> [SKIP][116] ([Intel XE#5771] / [Intel XE#7590])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-lnl:          NOTRUN -> [FAIL][117] ([Intel XE#7695])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pm@s3-basic:
    - shard-ptl:          NOTRUN -> [SKIP][118] ([Intel XE#6867])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-ptl:          [PASS][119] -> [ABORT][120] ([Intel XE#9362]) +2 other tests abort
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
    - shard-lnl:          [PASS][121] -> [ABORT][122] ([Intel XE#9362]) +2 other tests abort
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [PASS][123] -> [ABORT][124] ([Intel XE#9362])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-2/igt@xe_pm_residency@cpg-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-3/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          NOTRUN -> [FAIL][125] ([Intel XE#9461]) +2 other tests fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_query@multigpu-query-topology:
    - shard-ptl:          NOTRUN -> [SKIP][126] ([Intel XE#6019])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#944])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#7569])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_sriov_flr@flr-basic.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][129] ([Intel XE#367]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-ptl:          [ABORT][131] ([Intel XE#7084] / [Intel XE#9378]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][133] ([Intel XE#3149] / [Intel XE#5408] / [Intel XE#6266]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-ptl:          [ABORT][135] ([Intel XE#9362]) -> [PASS][136] +8 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-1/igt@kms_hdr@bpc-switch-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [ABORT][137] ([Intel XE#9362] / [Intel XE#9581]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-8/igt@xe_ccs@suspend-resume.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-2/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [ABORT][139] ([Intel XE#9362]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-8/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-vram01-vram01.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-vram01-vram01.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [SKIP][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-5/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-8/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-1/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-3/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-6/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-3/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-4/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-5/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-5/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-4/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-4/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-4/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-8/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-3/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-3/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-1/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-1/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-7/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-7/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-7/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-7/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-2/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-8/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-4/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-8/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-2/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-8/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-2/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-1/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-3/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-3/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-3/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-6/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-1/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-1/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_module_load@load.html
    - shard-ptl:          ([PASS][188], [SKIP][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213]) ([Intel XE#9286]) -> ([PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-3/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-6/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-7/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-5/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-7/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-2/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-2/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-5/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-3/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-8/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-8/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-8/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-8/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-6/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-6/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-3/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-1/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-1/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-1/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-7/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-4/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-2/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-2/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-2/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-4/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-4/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-4/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-1/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-1/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-5/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-5/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-5/igt@xe_module_load@load.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-ptl:          [DMESG-WARN][239] ([Intel XE#7727]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-7/igt@xe_pm@s4-d3hot-basic-exec.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-5/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][241] ([Intel XE#9362]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][243] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][244] ([Intel XE#2426] / [Intel XE#5848])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][245] ([Intel XE#9426]) -> [ABORT][246] ([Intel XE#9362])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-3/igt@xe_pm@s4-exec-after.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-6/igt@xe_pm@s4-exec-after.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5844]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5844
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286
  [Intel XE#9340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9340
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378
  [Intel XE#9426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9426
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461
  [Intel XE#9531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9531
  [Intel XE#9535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9535
  [Intel XE#9581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9581


Build changes
-------------

  * Linux: xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67 -> xe-pw-176251v1

  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67: 9535f21e5e53e3f54e01125261d4c3875f161f67
  xe-pw-176251v1: 176251v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/index.html

--===============3493091456829283357==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add a minimum age gate to the shrink=
er</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/176251/">https://patchwork.freedesktop.org/series/176251/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-176251v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-176251v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5956-9535f21e5e53e3f54e01125261d4c3875=
f161f67_FULL -&gt; xe-pw-176251v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-176251v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@intel_hwmon@hwmon-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
225">Intel XE#7225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_big_fb@linear-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5901">Intel XE#5901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_big_fb@linear-max-hw-stri=
de-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_big_fb@x-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1467">Intel XE#1467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_bw@linear-tiling-4-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5824">Intel XE#5824</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lu=
t1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_chamelium_color_pipeline@=
plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_chamelium_edid@hdmi-mode-=
timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_chamelium_frames@hdmi-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_color_pipeline@plane-lut1=
d-lut1d@pipe-b-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_content_protection@atomic=
-dpms-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-bmg-7/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_content_protection@dp-mst=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-bmg-7/igt@kms_content_protection@uevent=
@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5846">Intel XE#5846</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_cursor_crc@cursor-sliding=
-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5900">Intel XE#5900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-3/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_cursor_crc@cursor-s=
uspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9375">Intel XE#9375</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cur=
sor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-=
flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5962">Intel XE#5962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_cursor_legacy@cursorb-vs-=
flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_dp_link_training@uhbr-mst=
-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/9531">Intel XE#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9535">Intel XE#9535</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/703">Intel XE#703</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms-on-n=
op-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_flip@2x-plain-flip-ts-che=
ck-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vbla=
nk@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bp=
p-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
hdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +56 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +12 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbch=
dr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbch=
dr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +16 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcp=
sr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcp=
sr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcp=
srhdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcp=
srhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_frontbuffer_tracking@hdr-=
rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7865">Intel XE#7865</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +11=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psrh=
dr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_plane@pixel-format-4-tile=
d-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_plane@pixel-format-4-tile=
d-lnl-ccs-modifier-source-clamping.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9340">Intel XE#9340</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_plane@pixel-format-4-tile=
d-lnl-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_plane@pixel-format-y-tile=
d-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_plane_lowres@tiling-none@=
pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5844">Intel XE#5844</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:=
</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel X=
E#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_pm_dc@dc5-psr-suspend-res=
ume.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@kms_pm_rpm@package-g7.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/681=
3">Intel XE#6813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7=
304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#73=
04</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_psr2_sf@pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms@edp-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_psr@pr-cursor-plane-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-4/igt@sriov_basic@pf-unbind-with-vf=
s-enabled-numvfs-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_ccs@suspend-resume.html">A=
BORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/93=
62">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_ccs@vm-bind-fault-mode-dec=
ompress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@xe_compute_preempt@compute-pr=
eempt-many-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5191">Intel XE#5191</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_evict@evict-mixed-threads-=
small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5764">Intel XE#5764</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@xe_evict_ccs@evict-overcommit=
-parallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit=
-standalone-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_exec_balancer@many-cm-virt=
ual-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7482">Intel XE#7482</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@xe_exec_balancer@no-exec-cm-p=
arallel-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-dyn-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-bmg-2/igt@xe_exec_multi_queue@many-queu=
es-dyn-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +18 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_exec_reset@multi-queue-cat=
-error-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@xe_exec_reset@multi-queue-clo=
se-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vm=
a:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-comp-single-vma.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-10/igt@xe_exec=
_threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-5/ig=
t@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9=
096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_exec_threads@threads-multi=
-queue-cm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_exec_threads@threads-multi=
-queue-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-bmg-2/igt@xe_exec_threads@threads-multi=
-queue-shared-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_gpgpu_fill@offset-4x4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-device:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_madvise@atomic-device.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_mmap@pci-membarrier-bad-pa=
gesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867">I=
ntel XE#5867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_multigpu_svm@mgpu-latency-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_page_reclaim@basic-mixed.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/577=
1">Intel XE#5771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_pat@pat-sw-hw-suspend.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_pm@s3-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Inte=
l XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-6/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_pm@s4-vm-bind-unbind-a=
ll.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-4/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-a=
ll.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-2/igt@xe_pm_re=
sidency@cpg-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-176251v1/shard-bmg-3/igt@xe_pm_residency@cpg-basic.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_pmu@engine-activity-accura=
cy-90.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9461">Intel XE#9461</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw=
-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_sriov_flr@flr-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/75=
69">Intel XE#7569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-9/igt@kms_bw@l=
inear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-b=
mg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378"=
>Intel XE#9378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-176251v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-=
ccs@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel=
 XE#3149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5408">Intel XE#5408</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-9/igt@kms_flip@2x-flip-v=
s-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-1/igt@kms_hdr@=
bpc-switch-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@kms_hdr@bpc=
-switch-suspend.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-8/igt@xe_ccs@s=
uspend-resume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9362">Intel XE#9362</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9581">Intel XE#9581</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-bmg-2/igt@xe=
_ccs@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-8/igt@xe_ccs@s=
uspend-resume@xmajor-compressed-compfmt0-vram01-vram01.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#=
9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
176251v1/shard-bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-v=
ram01-vram01.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-l=
nl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/sha=
rd-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f16=
1f67/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c387=
5f161f67/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4=
c3875f161f67/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e011252=
61d4c3875f161f67/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01=
125261d4c3875f161f67/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f5=
4e01125261d4c3875f161f67/shard-lnl-4/igt@xe_module_load@load.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53=
e3f54e01125261d4c3875f161f67/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e=
5e53e3f54e01125261d4c3875f161f67/shard-lnl-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535=
f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-=
9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-=
lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/sh=
ard-lnl-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-176251v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-176251v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-176251v1/shard-lnl-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-176251v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-176251v1/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-176251v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-176251v1/shard-lnl-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-5/igt@xe_module_loa=
d@load.html">PASS</a>)</li>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-6/igt@xe_=
module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-p=
tl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/sha=
rd-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67=
/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f16=
1f67/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c387=
5f161f67/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4=
c3875f161f67/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e011252=
61d4c3875f161f67/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01=
125261d4c3875f161f67/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f5=
4e01125261d4c3875f161f67/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53=
e3f54e01125261d4c3875f161f67/shard-ptl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e=
5e53e3f54e01125261d4c3875f161f67/shard-ptl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-9535=
f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5956-=
9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-=
ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/sh=
ard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f6=
7/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9286">Intel XE#9286</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-p=
tl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
76251v1/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-176251v1/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-p=
tl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
76251v1/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-176251v1/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-p=
tl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
76251v1/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-176251v1/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-p=
tl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
76251v1/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-176251v1/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-p=
tl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
76251v1/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-176251v1/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-ptl-7/igt@xe_pm@s4=
-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-ptl-5/igt@xe_pm@s=
4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-7/igt@xe_pm@s4=
-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-7/igt@xe_pm@s4-vm-b=
ind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel X=
E#7437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-176251v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67/shard-lnl-3/igt@xe_pm@s4=
-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9426">Intel XE#9426</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-176251v1/shard-lnl-6/igt@xe_pm@s4-exec-afte=
r.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67 -&gt; xe-pw-176=
251v1</li>
</ul>
<p>IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5956-9535f21e5e53e3f54e01125261d4c3875f161f67: 9535f21e5e53e3f54e01125=
261d4c3875f161f67<br />
  xe-pw-176251v1: 176251v1</p>

</body>
</html>

--===============3493091456829283357==--
