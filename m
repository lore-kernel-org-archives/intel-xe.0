Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A753C79FAA
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 07:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC61710EF7A;
	Wed,  9 Sep 2026 07:33:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DD810EF7A;
 Wed,  9 Sep 2026 07:33:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9173389569773890640=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Modify_the_SW_tail_logic_i?=
 =?utf-8?q?n_OA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 07:33:23 -0000
Message-ID: <178893920338.139265.5333085110856696266@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908222356.1210175-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260908222356.1210175-5-umesh.nerlige.ramappa@intel.com>
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

--===============9173389569773890640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Modify the SW tail logic in OA
URL   : https://patchwork.freedesktop.org/series/173635/
State : failure

== Summary ==

CI Bug Log - changes from xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada_FULL -> xe-pw-173635v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-173635v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-173635v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-173635v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +3 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-173635v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - shard-lnl:          [PASS][3] -> [SKIP][4] ([Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@fbdev@read.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@fbdev@read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1466])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2233])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1407]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652]) +8 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#373]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_color@ctm-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#3297])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_color@ctm-0-25.html

  * igt@kms_color@ctm-green-to-red:
    - shard-lnl:          [PASS][18] -> [SKIP][19] ([Intel XE#3297]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_color@ctm-green-to-red.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_color@ctm-green-to-red.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-lnl:          [PASS][20] -> [SKIP][21] ([Intel XE#7006]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#7642])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#6974])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1424]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2320])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#9009])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#8265]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [PASS][29] -> [SKIP][30] ([Intel XE#8680]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2374] / [Intel XE#6127])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_feature_discovery@psr1.html
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1135])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1421]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-lnl:          [PASS][34] -> [SKIP][35] ([Intel XE#9132])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2482]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][37] ([Intel XE#301])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-lnl:          [PASS][38] -> [SKIP][39] ([Intel XE#2482]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_flip@plain-flip-ts-check.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1745] / [Intel XE#9144])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [PASS][41] -> [SKIP][42] ([Intel XE#1745] / [Intel XE#9144]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7178] / [Intel XE#7351])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-lnl:          [PASS][46] -> [SKIP][47] ([Intel XE#2682])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7061] / [Intel XE#7356])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7905]) +12 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#7779]) +26 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4141]) +8 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#656] / [Intel XE#7905]) +9 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1469] / [Intel XE#7399]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#6312]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +20 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7061]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7865]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          [PASS][59] -> [SKIP][60] ([Intel XE#7779]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          [PASS][61] -> [SKIP][62] ([Intel XE#2548] / [Intel XE#7779]) +16 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2313]) +22 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2548] / [Intel XE#7779]) +16 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_invalid_mode@bad-htotal:
    - shard-lnl:          [PASS][65] -> [SKIP][66] ([Intel XE#2568]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_invalid_mode@bad-htotal.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_invalid_mode@bad-htotal.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6911] / [Intel XE#7466])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#6900] / [Intel XE#7362])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_lease@lease-invalid-plane:
    - shard-lnl:          [PASS][69] -> [SKIP][70] ([Intel XE#9125]) +51 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_lease@lease-invalid-plane.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_lease@lease-invalid-plane.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-lnl:          [PASS][71] -> [SKIP][72] ([Intel XE#7250] / [Intel XE#9128])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#8303]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#7283]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7283])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][76] -> [SKIP][77] ([Intel XE#9128]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_plane@plane-position-covered.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#9128])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#5020] / [Intel XE#7348])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-lnl:          [PASS][80] -> [SKIP][81] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_plane_scaling@invalid-num-scalers.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-lnl:          [PASS][82] -> [SKIP][83] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:
    - shard-lnl:          [PASS][84] -> [SKIP][85] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +7 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#2763] / [Intel XE#6886]) +9 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-lnl:          [PASS][88] -> [SKIP][89] ([Intel XE#7760])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_pm_backlight@brightness-with-dpms.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#8399])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-lnl:          [PASS][92] -> [SKIP][93] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#6813])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_pm_rpm@package-g7.html
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#6814] / [Intel XE#7428])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-lnl:          [PASS][96] -> [SKIP][97] ([Intel XE#7106])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_pm_rpm@system-suspend-idle.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-lnl:          [PASS][98] -> [SKIP][99] ([Intel XE#9129])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_properties@crtc-properties-atomic.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#4608] / [Intel XE#7304]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#4608]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1489])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1489]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2893] / [Intel XE#7304])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [PASS][106] -> [SKIP][107] ([Intel XE#1489]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1122] / [Intel XE#7429])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2387] / [Intel XE#7429])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1406]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-lnl:          [PASS][113] -> [SKIP][114] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_psr@psr-dpms.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2234])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic-no-cpu-idle:
    - shard-lnl:          [PASS][118] -> [SKIP][119] ([Intel XE#9142])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_setmode@basic-no-cpu-idle.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_setmode@basic-no-cpu-idle.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#6503])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#330] / [Intel XE#5857])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@wait-forked-hang:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#9125]) +31 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_vblank@wait-forked-hang.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#1499]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#6540] / [Intel XE#688]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#8370])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#7482]) +8 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_exec_balancer@no-exec-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1392]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#8374]) +5 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#8374]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_exec_fault_mode@twice-multi-queue-prefetch.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#8364]) +14 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#8364]) +10 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#8369]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#6196])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-fd-basic:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#8378]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-fd-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#8378]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_mmap@pci-membarrier.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#6964]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#6964]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#7793])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_peer2peer@read.html
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [PASS][144] -> [INCOMPLETE][145] ([Intel XE#8175])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-3/igt@xe_pm@s3-multiple-execs.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#584] / [Intel XE#7369])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#944]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#944])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#4130] / [Intel XE#7366])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#3342])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-lnl:          [SKIP][151] ([Intel XE#2134]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@fbdev@nullptr.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@fbdev@nullptr.html

  * igt@kms_color@ctm-max:
    - shard-lnl:          [SKIP][153] ([Intel XE#3297]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_color@ctm-max.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_color@ctm-max.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [SKIP][155] ([Intel XE#1511] / [Intel XE#3297]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_color@deep-color.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_color@deep-color.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [SKIP][157] ([Intel XE#2482]) -> [PASS][158] +7 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-lnl:          [SKIP][159] ([Intel XE#1745] / [Intel XE#9144]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][161] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][162] +18 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][163] ([Intel XE#7779]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-lnl:          [SKIP][165] ([Intel XE#2568]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_invalid_mode@bad-vtotal.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-lnl:          [SKIP][167] ([Intel XE#7250] / [Intel XE#9128]) -> [PASS][168] +2 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-lnl:          [SKIP][169] ([Intel XE#7780] / [Intel XE#9125]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane@planar-pixel-format-settings.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-lnl:          [SKIP][171] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][172] +9 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          [SKIP][173] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][174] +9 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-lnl:          [SKIP][175] ([Intel XE#6927] / [Intel XE#8854]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_dc@dc5-pageflip-negative.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [SKIP][177] ([Intel XE#7794]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-lnl:          [SKIP][179] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [SKIP][181] ([Intel XE#4886]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-lnl:          [SKIP][183] ([Intel XE#9126]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_properties@colorop-properties-legacy.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-lnl:          [SKIP][185] ([Intel XE#9129]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_properties@plane-properties-legacy.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][187] ([Intel XE#1489]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [SKIP][189] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][190] +4 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          [SKIP][191] ([Intel XE#9125]) -> [PASS][192] +53 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_vblank@query-forked.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_vblank@query-forked.html

  * igt@xe_configfs@ctx-restore-mid-bb-invalid:
    - shard-bmg:          [ABORT][193] ([Intel XE#8007]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-9/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_configfs@ctx-restore-mid-bb-invalid.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [SKIP][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-9/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-7/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-3/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-7/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-6/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-5/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-7/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-8/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-4/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-9/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-10/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-8/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-1/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-5/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-10/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-1/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-6/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-1/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-2/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-7/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-4/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-2/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-5/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-8/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-3/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-3/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-10/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-2/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-6/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-7/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-7/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-7/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-1/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-6/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-5/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-5/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-5/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-2/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-6/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-8/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-10/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-1/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-8/igt@xe_module_load@load.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-lnl:          [SKIP][246] ([Intel XE#7590] / [Intel XE#9125]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@xe_pat@display-vs-wb-transient.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@xe_pat@display-vs-wb-transient.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          [SKIP][248] ([Intel XE#3279]) -> [SKIP][249] ([Intel XE#9125])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][250] ([Intel XE#9125]) -> [SKIP][251] ([Intel XE#3658] / [Intel XE#7360]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][252] ([Intel XE#1407]) -> [SKIP][253] ([Intel XE#9125]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][254] ([Intel XE#9125]) -> [SKIP][255] ([Intel XE#7059] / [Intel XE#7085])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-lnl:          [SKIP][256] ([Intel XE#9125]) -> [SKIP][257] ([Intel XE#1407]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          [SKIP][258] ([Intel XE#1124]) -> [SKIP][259] ([Intel XE#9125]) +7 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          [SKIP][260] ([Intel XE#9125]) -> [SKIP][261] ([Intel XE#1467] / [Intel XE#7367]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][262] ([Intel XE#1428] / [Intel XE#7387]) -> [SKIP][263] ([Intel XE#9125])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-lnl:          [SKIP][264] ([Intel XE#9125]) -> [SKIP][265] ([Intel XE#1124]) +9 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
    - shard-lnl:          [SKIP][266] ([Intel XE#7679]) -> [SKIP][267] ([Intel XE#9125]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][268] ([Intel XE#8365]) -> [SKIP][269] ([Intel XE#9125])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][270] ([Intel XE#9125]) -> [SKIP][271] ([Intel XE#8365]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][272] ([Intel XE#367]) -> [INCOMPLETE][273] ([Intel XE#6819] / [Intel XE#8957])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][274] ([Intel XE#9125]) -> [SKIP][275] ([Intel XE#367]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][276] ([Intel XE#367]) -> [SKIP][277] ([Intel XE#9125]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][278] ([Intel XE#9125]) -> [SKIP][279] ([Intel XE#3432]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-lnl:          [SKIP][280] ([Intel XE#3432]) -> [SKIP][281] ([Intel XE#9125]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][282] ([Intel XE#2887]) -> [SKIP][283] ([Intel XE#9125]) +12 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][284] ([Intel XE#9125]) -> [SKIP][285] ([Intel XE#2887]) +12 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][286] ([Intel XE#2669] / [Intel XE#7389]) -> [SKIP][287] ([Intel XE#9125]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          [SKIP][288] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][289] ([Intel XE#7006])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          [SKIP][290] ([Intel XE#7642]) -> [SKIP][291] ([Intel XE#9125]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_content_protection@lic-type-0.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@suspend-resume:
    - shard-lnl:          [SKIP][292] ([Intel XE#9125]) -> [SKIP][293] ([Intel XE#7642]) +4 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_content_protection@suspend-resume.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          [SKIP][294] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][295] ([Intel XE#9125])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_cursor_crc@cursor-random-512x512.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          [SKIP][296] ([Intel XE#9125]) -> [SKIP][297] ([Intel XE#1424]) +4 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          [SKIP][298] ([Intel XE#1424]) -> [SKIP][299] ([Intel XE#9125]) +4 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-lnl:          [SKIP][300] ([Intel XE#9125]) -> [SKIP][301] ([Intel XE#309] / [Intel XE#7343]) +4 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          [SKIP][302] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][303] ([Intel XE#9125]) +5 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][304] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][305] ([Intel XE#309] / [Intel XE#7343])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][306] ([Intel XE#9125]) -> [SKIP][307] ([Intel XE#323] / [Intel XE#6035])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          [SKIP][308] ([Intel XE#4331] / [Intel XE#7227]) -> [SKIP][309] ([Intel XE#9125])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-lnl:          [SKIP][310] ([Intel XE#9125]) -> [SKIP][311] ([Intel XE#8265]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          [SKIP][312] ([Intel XE#8265]) -> [SKIP][313] ([Intel XE#9125]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-lnl:          [SKIP][314] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][315] ([Intel XE#9125]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [SKIP][316] ([Intel XE#2482]) -> [FAIL][317] ([Intel XE#301])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][318] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][319] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          [SKIP][320] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][321] ([Intel XE#2548] / [Intel XE#7779]) +9 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [SKIP][322] ([Intel XE#6312]) -> [SKIP][323] ([Intel XE#7779]) +15 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-lnl:          [SKIP][324] ([Intel XE#7779]) -> [SKIP][325] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          [SKIP][326] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][327] ([Intel XE#1469] / [Intel XE#7399])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][328] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][329] ([Intel XE#7779]) +4 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][330] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][331] ([Intel XE#6312] / [Intel XE#651]) +9 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
    - shard-lnl:          [SKIP][332] ([Intel XE#7779]) -> [SKIP][333] ([Intel XE#6312]) +15 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          [SKIP][334] ([Intel XE#7779]) -> [SKIP][335] ([Intel XE#7905]) +43 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][336] ([Intel XE#7779]) -> [SKIP][337] ([Intel XE#7061]) +3 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-lnl:          [SKIP][338] ([Intel XE#7865]) -> [SKIP][339] ([Intel XE#7779]) +26 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-lnl:          [SKIP][340] ([Intel XE#7399]) -> [SKIP][341] ([Intel XE#7779])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-move:
    - shard-lnl:          [SKIP][342] ([Intel XE#7905]) -> [SKIP][343] ([Intel XE#7779]) +47 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-move.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][344] ([Intel XE#7061]) -> [SKIP][345] ([Intel XE#7779]) +4 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][346] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][347] ([Intel XE#656] / [Intel XE#7905]) +37 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][348] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][349] ([Intel XE#2548] / [Intel XE#7779]) +35 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-lnl:          [SKIP][350] ([Intel XE#7779]) -> [SKIP][351] ([Intel XE#7865]) +34 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          [SKIP][352] ([Intel XE#9125]) -> [SKIP][353] ([Intel XE#3374] / [Intel XE#3544])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_hdr@brightness-with-hdr.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          [SKIP][354] ([Intel XE#9125]) -> [SKIP][355] ([Intel XE#1503])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_hdr@static-toggle-suspend.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-lnl:          [SKIP][356] ([Intel XE#599] / [Intel XE#7382]) -> [SKIP][357] ([Intel XE#9125])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_plane_lowres@tiling-none.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          [SKIP][358] ([Intel XE#4596] / [Intel XE#5854]) -> [SKIP][359] ([Intel XE#9125]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-none.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          [SKIP][360] ([Intel XE#7343] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][361] ([Intel XE#309] / [Intel XE#7343])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          [SKIP][362] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][363] ([Intel XE#3307])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-size.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:
    - shard-lnl:          [SKIP][364] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][365] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][366] ([Intel XE#2029] / [Intel XE#7395]) -> [SKIP][367] ([Intel XE#7778])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][368] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][369] ([Intel XE#1489]) +5 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][370] ([Intel XE#1489]) -> [SKIP][371] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][372] ([Intel XE#1489]) -> [SKIP][373] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          [SKIP][374] ([Intel XE#1128] / [Intel XE#7413]) -> [SKIP][375] ([Intel XE#1122] / [Intel XE#7429])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_psr2_su@page_flip-nv12.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          [SKIP][376] ([Intel XE#1122] / [Intel XE#7429]) -> [SKIP][377] ([Intel XE#1128] / [Intel XE#7413])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2_su@page_flip-p010.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          [SKIP][378] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][379] ([Intel XE#1406] / [Intel XE#7345]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          [SKIP][380] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][381] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-render.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          [SKIP][382] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][383] ([Intel XE#1406]) +5 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@pr-basic.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          [SKIP][384] ([Intel XE#1406]) -> [SKIP][385] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_psr@pr-sprite-blt.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][386] ([Intel XE#9125]) -> [SKIP][387] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][388] ([Intel XE#9125]) -> [SKIP][389] ([Intel XE#1127] / [Intel XE#5813])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][390] ([Intel XE#1127] / [Intel XE#5813]) -> [SKIP][391] ([Intel XE#9125])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          [SKIP][392] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][393] ([Intel XE#9125]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-90.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          [SKIP][394] ([Intel XE#362] / [Intel XE#5848]) -> [SKIP][395] ([Intel XE#9125]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          [SKIP][396] ([Intel XE#9125]) -> [SKIP][397] ([Intel XE#1499])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_vrr@negative-basic.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-lnl:          [SKIP][398] ([Intel XE#1499]) -> [SKIP][399] ([Intel XE#9125])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@runner@aborted:
    - shard-lnl:          ([FAIL][400], [FAIL][401]) ([Intel XE#8990] / [Intel XE#9183]) -> [FAIL][402] ([Intel XE#9183])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@runner@aborted.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@runner@aborted.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@runner@aborted.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-bmg:          [ABORT][403] ([Intel XE#8007] / [Intel XE#8868]) -> [ABORT][404] ([Intel XE#8868])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-2/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-8/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [ABORT][405] ([Intel XE#9145]) -> [DMESG-WARN][406] ([Intel XE#9130])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-9/igt@xe_exec_reset@gt-reset-fault-injection.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-5/igt@xe_exec_reset@gt-reset-fault-injection.html
    - shard-lnl:          [DMESG-WARN][407] ([Intel XE#9130]) -> [ABORT][408] ([Intel XE#9140] / [Intel XE#9145])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-5/igt@xe_exec_reset@gt-reset-fault-injection.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7778]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7778
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8957]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8957
  [Intel XE#8990]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8990
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9126
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132
  [Intel XE#9140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#9183]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9183
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -> xe-pw-173635v1

  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada
  xe-pw-173635v1: 173635v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/index.html

--===============9173389569773890640==
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
<tr><td><b>Series:</b></td><td>Modify the SW tail logic in OA</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/173635/">https://patchwork.freedesktop.org/series/173635/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-173635v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173635v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5710-dd822035c9dcd89e47cbfa75da6f31196=
17fbada_FULL -&gt; xe-pw-173635v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-173635v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-173635v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1736=
35v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_hdr@static-toggle-suspend:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-7/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-6/igt@kms_hdr@static-toggle-s=
uspend.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173635v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@fbdev@re=
ad.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-173635v1/shard-lnl-6/igt@fbdev@read.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc=
-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc=
-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_color@ctm-0-25.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">=
Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_colo=
r@ctm-green-to-red.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_color@ctm-green-to-red=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3297">Intel XE#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_colo=
r_pipeline@plane-lut1d-post-ctm3x4.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_color_=
pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_content_protection@atomic=
-dpms-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_content_protection@dp-mst=
-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_content_protection@uevent=
-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_cursor_crc@cursor-offscre=
en-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding=
-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_fbco=
n_fbt@psr-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8680">Intel XE#8680</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6127">Intel XE#6127</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_flip@2x-plain-flip-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_flip=
@flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_flip@f=
lip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9132">Intel XE#9132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2482">Intel XE#2482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vbla=
nk@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_flip=
@plain-flip-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_flip@plain-flip-ts-c=
heck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2482">Intel XE#2482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-l=
nl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9144">Intel XE#9144</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE=
#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_flip=
_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_flip_tiling@fl=
ip-change-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2682">Intel XE#2682</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
hdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
hdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +26 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +20 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard=
-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7779">Intel XE#7779</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-=
lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7779">Intel XE#7779</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-=
slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +16 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_inva=
lid_mode@bad-htotal.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_invalid_mode@bad-htot=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2568">Intel XE#2568</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_leas=
e@lease-invalid-plane.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_lease@lease-invalid=
-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9125">Intel XE#9125</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_plan=
e@pixel-format-4-tiled-lnl-ccs-modifier.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_p=
lane@pixel-format-4-tiled-lnl-ccs-modifier.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE=
#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_plane@pixel-format-4-tile=
d-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_plane@pixel-format-4-tile=
d-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_plan=
e@plane-position-covered.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane@plane-posi=
tion-covered.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9128">Intel XE#9128</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane@plane-position-hole=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_plan=
e_scaling@invalid-num-scalers.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane_scali=
ng@invalid-num-scalers.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/sh=
ard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@p=
ipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/sh=
ard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@p=
ipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>=
) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel X=
E#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_pm_b=
acklight@brightness-with-dpms.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_pm_backligh=
t@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_pm_d=
c@dc5-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel=
 XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_pm_r=
pm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_pm_rpm@mod=
eset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#738=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836"=
>Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_pm_rpm@package-g7.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/681=
3">Intel XE#6813</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_pm_rpm@package-g7.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/681=
4">Intel XE#6814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_pm_r=
pm@system-suspend-idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_pm_rpm@system-susp=
end-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7106">Intel XE#7106</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_prop=
erties@crtc-properties-atomic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_properties@=
crtc-properties-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9129">Intel XE#9129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304"=
>Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_psr2=
_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/i=
gt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel =
XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-blt@e=
dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_psr@pr-cursor-plane-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr@pr-cursor-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_psr@=
psr-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr@psr-dpms.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#=
2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
29">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_psr@psr2-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-no-cpu-idle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_setm=
ode@basic-no-cpu-idle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_setmode@basic-no-cp=
u-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_sharpness_filter@invalid-=
filter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_vblank@wait-forked-hang.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9125">Intel XE#9125</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_evict@evict-beng-small-mul=
ti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@xe_evict@evict-small-multi-qu=
eue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_exec_balancer@no-exec-cm-p=
arallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7482">Intel XE#7482</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_exec_fault_mode@twice-mult=
i-queue-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +14 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +10 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_exec_reset@multi-queue-clo=
se-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_exec_threads@threads-multi=
-queue-fd-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_exec_threads@threads-multi=
-queue-mixed-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_mmap@pci-membarrier.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
00">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7322">Intel XE#7322</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-concurre=
nt-access-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_multigpu_svm@mgpu-migratio=
n-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_page_reclaim@binds-full-pd=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">I=
ntel XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-3/igt@xe_pm@s3=
-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8175">Intel XE#8175</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_pm@s3-vm-bind-prefetch.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_query@multigpu-query-oa-un=
its.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-4/igt@xe_sriov_auto_provisioning@re=
sources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@fbdev@nu=
llptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@fbdev@nullptr.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_colo=
r@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_color@ctm-max.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_colo=
r@deep-color.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1511">Intel XE#1511</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_=
color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip=
@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_fl=
ip@basic-flip-vs-wf_vblank.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
144">Intel XE#9144</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linea=
r-to-16bpp-linear-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn=
-pri-shrfb-draw-blt.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#=
7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
173635v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-s=
hrfb-draw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_inva=
lid_mode@bad-vtotal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_invalid=
_mode@bad-vtotal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plan=
e@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Int=
el XE#9128</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-173635v1/shard-lnl-3/igt@kms_plane@pixel-format-x-tiled-modifier-sour=
ce-clamping.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plan=
e@planar-pixel-format-settings.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7780">Intel XE#7780</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/sh=
ard-lnl-3/igt@kms_plane@planar-pixel-format-settings.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE=
#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6886">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_pla=
ne_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">PASS</a> +9=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plan=
e_scaling@planes-scaler-unity-scaling@pipe-b.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel =
XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173635v1/shard-lnl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@p=
ipe-b.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_d=
c@dc5-pageflip-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6927">Intel XE#6927</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl=
-2/igt@kms_pm_dc@dc5-pageflip-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7794">Intel XE#7794</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_pm_dc@dc5-psr.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635=
v1/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_pm_r=
pm@universal-planes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_pm_rpm@=
universal-planes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_prop=
erties@colorop-properties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9126">Intel XE#9126</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/ig=
t@kms_properties@colorop-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_prop=
erties@plane-properties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9129">Intel XE#9129</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/ig=
t@kms_properties@plane-properties-legacy.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2=
_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/sha=
rd-lnl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@=
psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3=
/igt@kms_psr@psr2-sprite-plane-onoff.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_vbla=
nk@query-forked.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_vblank@quer=
y-forked.html">PASS</a> +53 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-mid-bb-invalid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-9/igt@xe_confi=
gfs@ctx-restore-mid-bb-invalid.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/ig=
t@xe_configfs@ctx-restore-mid-bb-invalid.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada=
/shard-bmg-7/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617f=
bada/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119=
617fbada/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f=
3119617fbada/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75=
da6f3119617fbada/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cb=
fa75da6f3119617fbada/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e=
47cbfa75da6f3119617fbada/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dc=
d89e47cbfa75da6f3119617fbada/shard-bmg-10/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd82203=
5c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710-dd8=
22035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5710=
-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-5/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-10/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-1/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shar=
d-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/=
shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fb=
ada/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7=
405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
173635v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-3/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-173635v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-=
bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-9/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
173635v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173635v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard=
-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173635v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173635v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard=
-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173635v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-5/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173635v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard=
-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173635v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173635v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shar=
d-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@xe_pat@d=
isplay-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-=
7/igt@xe_pat@display-vs-wb-transient.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1736=
35v1/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fen=
cing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE=
#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173635v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-h=
flip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1=
/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9125">Intel XE#9125</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_=
fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/=
shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_=
fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms=
_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_big_=
fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@km=
s_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_=
fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_big_fb@yf=
-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1467">Intel XE#1467</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_big_=
fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/s=
hard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shar=
d-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">In=
tel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1736=
35v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1736=
35v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1736=
35v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8365">Intel XE#8365</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-10/igt@kms_bw@=
linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-=
bmg-3/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819"=
>Intel XE#6819</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8957">Intel XE#8957</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_bw@l=
inear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard=
-lnl-3/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel=
 XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_bw@l=
inear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-l=
nl-6/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-ln=
l-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3=
432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_ccs@=
crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/ig=
t@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shar=
d-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">In=
tel XE#9125</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_ccs@=
crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1=
/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_ccs@=
random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/s=
hard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_colo=
r_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1=
/shard-lnl-6/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel =
XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_cont=
ent_protection@suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@k=
ms_content_protection@suspend-resume.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_curs=
or_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shar=
d-lnl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_curs=
or_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl=
-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#142=
4</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_curs=
or_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/ig=
t@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-l=
nl-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#=
309</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
43">Intel XE#7343</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/s=
hard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE=
#9125</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-8/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel X=
E#7343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7935">Intel XE#7935</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173635v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel X=
E#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/sh=
ard-lnl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#912=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_dsc@=
dsc-basic-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_dsc@d=
sc-basic-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_dsc@=
dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shar=
d-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">In=
tel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Int=
el XE#7442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-173635v1/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-v=
isible-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_fli=
p@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
144">Intel XE#9144</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile=
-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#=
7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">=
Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-=
shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#631=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173=
635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indf=
b-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7779">Intel XE#7779</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/sh=
ard-lnl-3/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061=
">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/sha=
rd-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399"=
>Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel=
 XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7779">Intel XE#7779</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel X=
E#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-173635v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-modesetfrombusy.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/sha=
rd-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">=
Intel XE#6312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#=
7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
173635v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shr=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7905">Intel XE#7905</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1736=
35v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mm=
ap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/=
igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)=
 +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6=
/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@hdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1=
/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7779">Intel XE#7779</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/sh=
ard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779=
">Intel XE#7779</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn=
-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +37 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905=
">Intel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscr=
n-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +35 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1736=
35v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7865">Intel XE#7865</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-3/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_hdr@s=
tatic-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_plan=
e_lowres@tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/ig=
t@kms_plane_lowres@tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-l=
nl-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173635v1/shard-lnl-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"=
>Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plan=
e_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE=
#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173635v1/shard-lnl-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">In=
tel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_plan=
e_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_p=
lane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Int=
el XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_pm_d=
c@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2029">Intel XE#2029</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_p=
m_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7778">Intel XE#7778</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_psr2=
_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel=
 XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-173635v1/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-contin=
uous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel X=
E#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-173635v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuou=
s-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2=
_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-l=
nl-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE=
#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/ig=
t@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/ig=
t@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@=
fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_p=
sr@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_psr@=
fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-=
6/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_psr@=
pr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-2/igt@kms_psr@pr=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1406">Intel XE#1406</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_psr@=
pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_psr@pr-sprite=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_rota=
tion_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-=
2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904"=
>Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl=
-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#112=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813=
">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-2/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#58=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
3635v1/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-7/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#=
7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
173635v1/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Inte=
l XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#=
5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
173635v1/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern-with-chameliu=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-7/igt@kms_vrr@negative=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-1/igt@kms_vrr@=
seamless-rr-switch-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@kms_vrr=
@seamless-rr-switch-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-3/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-6/igt@runner@a=
borted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8990">Intel XE#8990</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9183">Intel XE#9183</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-6/igt@runner@ab=
orted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9183">Intel XE#9183</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-2/igt@sriov_ba=
sic@pf-unbind-with-vfs-enabled-numvfs-all.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE=
#8868</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173635v1/shard-bmg-8/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-bmg-9/igt@xe_exec_=
reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-bmg-5/ig=
t@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>)=
</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada/shard-lnl-5/igt@xe_exec_=
reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173635v1/shard-lnl-=
5/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9140">Intel XE#9140</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel=
 XE#9145</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -&gt; xe-pw-173=
635v1</li>
</ul>
<p>IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa7=
5da6f3119617fbada<br />
  xe-pw-173635v1: 173635v1</p>

</body>
</html>

--===============9173389569773890640==--
