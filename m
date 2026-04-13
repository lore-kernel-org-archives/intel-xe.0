Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A43F531DE
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 23:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BC110E3E9;
	Mon, 13 Apr 2026 23:17:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DD210E3E9;
 Mon, 13 Apr 2026 23:17:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7296587921536427543=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Apply_WA=5F14026?=
 =?utf-8?q?810691_to_engine_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Clint Taylor" <clinton.a.taylor@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Apr 2026 23:17:15 -0000
Message-ID: <177612223532.459650.7562693023443829868@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260413200825.4054940-1-clinton.a.taylor@intel.com>
In-Reply-To: <20260413200825.4054940-1-clinton.a.taylor@intel.com>
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

--===============7296587921536427543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Apply WA_14026810691 to engine (rev2)
URL   : https://patchwork.freedesktop.org/series/164657/
State : failure

== Summary ==

CI Bug Log - changes from xe-4896-773e7de886203adcc760cdb23af43037995c69b4_FULL -> xe-pw-164657v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-164657v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-164657v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-164657v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-10/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  
Known issues
------------

  Here are the changes found in xe-pw-164657v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +6 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +21 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2328] / [Intel XE#7367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#607] / [Intel XE#7361])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7621]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#7679]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367] / [Intel XE#7354]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652]) +17 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#3432]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +28 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2724] / [Intel XE#7449])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2252]) +13 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#6974]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2390] / [Intel XE#6974])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7642]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +10 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#7571]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-bmg:          NOTRUN -> [ABORT][26] ([Intel XE#5545] / [Intel XE#6652])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2286] / [Intel XE#6035])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1508])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1340] / [Intel XE#7435])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4354] / [Intel XE#5882])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4354] / [Intel XE#7386])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2244])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4422] / [Intel XE#7442]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4156] / [Intel XE#7425])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6126] / [Intel XE#776])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2373] / [Intel XE#7448])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2374] / [Intel XE#6127])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7178] / [Intel XE#7349]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7179]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2311]) +56 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4141]) +26 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2313]) +58 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2350] / [Intel XE#7503])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7061] / [Intel XE#7356]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6911] / [Intel XE#7378])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#6911] / [Intel XE#7466])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7591])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7130]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7283]) +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2393])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#5021] / [Intel XE#7377])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7376] / [Intel XE#870]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3309] / [Intel XE#7368])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1489]) +14 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2387] / [Intel XE#7429])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2234] / [Intel XE#2850]) +23 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#3904] / [Intel XE#7342]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2330] / [Intel XE#5813]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#6503]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2426] / [Intel XE#5848])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#1499]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6599]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7636]) +26 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_eudebug@discovery-empty.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7140]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2322] / [Intel XE#7372]) +16 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7136]) +24 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#6874]) +54 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7138]) +17 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6964]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#7695])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#7590])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2284] / [Intel XE#7370])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7599]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#4733] / [Intel XE#7417]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#944]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#6569])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][82] ([Intel XE#5545])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [SKIP][83] ([Intel XE#6779]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@core_hotunplug@hotreplug.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@core_hotunplug@hotreplug.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [SKIP][85] ([Intel XE#5177] / [Intel XE#6703]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@intel_hwmon@hwmon-write.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][87] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][88] +1 other test pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][89] ([Intel XE#1503]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-bmg:          [FAIL][91] -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [FAIL][93] ([Intel XE#5625]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset:
    - shard-bmg:          [DMESG-FAIL][95] ([Intel XE#6652]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap:
    - shard-bmg:          [SKIP][97] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch:
    - shard-bmg:          [SKIP][99] ([Intel XE#6703]) -> [PASS][100] +113 other tests pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [ABORT][101] -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [ABORT][103] ([Intel XE#7578]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_render_copy@render-square@render-linear-256x256:
    - shard-bmg:          [ABORT][105] ([Intel XE#5545] / [Intel XE#6652]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_render_copy@render-square@render-linear-256x256.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@xe_render_copy@render-square@render-linear-256x256.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][107] ([Intel XE#6703]) -> [SKIP][108] ([Intel XE#2327]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][109] ([Intel XE#6703]) -> [SKIP][110] ([Intel XE#1124]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][111] ([Intel XE#6703]) -> [SKIP][112] ([Intel XE#367] / [Intel XE#7354])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][113] ([Intel XE#6703]) -> [SKIP][114] ([Intel XE#2887]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-bmg:          [SKIP][115] ([Intel XE#6703]) -> [SKIP][116] ([Intel XE#2252])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][117] ([Intel XE#6703]) -> [SKIP][118] ([Intel XE#2390] / [Intel XE#6974])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-bmg:          [SKIP][119] ([Intel XE#6703]) -> [SKIP][120] ([Intel XE#2320])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][121] ([Intel XE#6703]) -> [SKIP][122] ([Intel XE#2244])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][123] ([Intel XE#6703]) -> [SKIP][124] ([Intel XE#7178] / [Intel XE#7351])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][125] ([Intel XE#6703]) -> [SKIP][126] ([Intel XE#2311]) +6 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][127] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][128] ([Intel XE#4141])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-bmg:          [SKIP][129] ([Intel XE#6703]) -> [SKIP][130] ([Intel XE#4141])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][131] ([Intel XE#6703]) -> [SKIP][132] ([Intel XE#7061] / [Intel XE#7356])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][133] ([Intel XE#6703]) -> [SKIP][134] ([Intel XE#2313]) +6 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][135] ([Intel XE#3544]) -> [SKIP][136] ([Intel XE#3374] / [Intel XE#3544])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][137] ([Intel XE#6703]) -> [SKIP][138] ([Intel XE#5021] / [Intel XE#7377])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][139] ([Intel XE#6703]) -> [SKIP][140] ([Intel XE#2763] / [Intel XE#6886])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][141] ([Intel XE#6703]) -> [SKIP][142] ([Intel XE#2499])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][143] ([Intel XE#6703]) -> [SKIP][144] ([Intel XE#1489]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          [SKIP][145] ([Intel XE#6703]) -> [SKIP][146] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_psr@fbc-psr2-sprite-render.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][147] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][148] ([Intel XE#1729] / [Intel XE#7424])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          [SKIP][149] ([Intel XE#6703]) -> [SKIP][150] ([Intel XE#7636]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          [SKIP][151] ([Intel XE#6703]) -> [SKIP][152] ([Intel XE#7140])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_evict@evict-threads-small-multi-queue.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][153] ([Intel XE#6703]) -> [SKIP][154] ([Intel XE#2322] / [Intel XE#7372])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:
    - shard-bmg:          [SKIP][155] ([Intel XE#6703]) -> [SKIP][156] ([Intel XE#7136]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@priority:
    - shard-bmg:          [SKIP][157] ([Intel XE#6703]) -> [SKIP][158] ([Intel XE#6874]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_multi_queue@priority.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_multi_queue@priority.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:
    - shard-bmg:          [SKIP][159] ([Intel XE#6703]) -> [SKIP][160] ([Intel XE#7138])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [DMESG-WARN][172], [DMESG-WARN][173], [DMESG-WARN][174], [DMESG-WARN][175], [DMESG-WARN][176], [DMESG-WARN][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184]) ([Intel XE#7725]) -> ([PASS][185], [PASS][186], [PASS][187], [PASS][188], [DMESG-WARN][189], [PASS][190], [PASS][191], [PASS][192], [DMESG-WARN][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [SKIP][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210]) ([Intel XE#2457] / [Intel XE#7405] / [Intel XE#7725])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-8/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-9/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-1/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-5/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-5/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-7/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-9/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-7/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-7/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-1/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-10/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-10/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-6/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-6/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-10/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-10/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-6/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-3/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-1/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-3/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-1/igt@xe_module_load@load.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][211] ([Intel XE#6703]) -> [SKIP][212] ([Intel XE#2245] / [Intel XE#7590])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_pat@pat-index-xelp.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          [SKIP][213] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][214] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_peer2peer@read.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_peer2peer@read.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-bmg:          [SKIP][215] ([Intel XE#6703]) -> [SKIP][216] ([Intel XE#4733] / [Intel XE#7417])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7621]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4896-773e7de886203adcc760cdb23af43037995c69b4 -> xe-pw-164657v2

  IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4896-773e7de886203adcc760cdb23af43037995c69b4: 773e7de886203adcc760cdb23af43037995c69b4
  xe-pw-164657v2: 164657v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/index.html

--===============7296587921536427543==
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
<tr><td><b>Series:</b></td><td>drm/xe: Apply WA_14026810691 to engine (rev2=
)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/164657/">https://patchwork.freedesktop.org/series/164657/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-164657v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-164657v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4896-773e7de886203adcc760cdb23af430379=
95c69b4_FULL -&gt; xe-pw-164657v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-164657v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-164657v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1646=
57v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-10/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@c-dp2.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-3/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">FAIL</a> +1 oth=
er test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164657v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stri=
de-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7621">Intel XE#7621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +17 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +28 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_content_protection@atomic=
-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_content_protection@dp-mst=
-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_content_protection@legacy=
-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>=
) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_content_protection@uevent=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cur=
sor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7571">Intel XE#7571</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cur=
sor-crc-legacy.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035"=
>Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6126">Intel XE#6126</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-p016=
-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +26 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +58 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_plane@pixel-format-4-tile=
d-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel X=
E#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_pm_backlight@bad-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/870">Intel XE#870</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +14 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_psr@psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_sharpness_filter@invalid-=
plane-with-filter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_compute@ccs-mode-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6599">Intel XE#6599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_eudebug@discovery-empty.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7636">Intel XE#7636</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_evict@evict-small-multi-qu=
eue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7140">Intel XE#7140</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) =
+16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +24 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_exec_multi_queue@two-queue=
s-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6874">Intel XE#6874</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +17 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">In=
tel XE#586</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7323">Intel XE#7323</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_multigpu_svm@mgpu-pagefaul=
t-conflict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7325">Intel XE#7325</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compar=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@xe_pat@pat-sw-hw-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7599">Intel XE#7599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_pxp@pxp-termination-key-up=
date-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +4 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
69">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@core_hot=
unplug@hotreplug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@core_hotunplug=
@hotreplug.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@intel_hw=
mon@hwmon-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@i=
ntel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shar=
d-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_rota=
tion_crc@multiplane-rotation-cropping-top.html">FAIL</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms=
_rotation_crc@multiplane-rotation-cropping-top.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-lnl-3/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE=
#5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-164657v2/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-id=
x-uc-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_=
system_allocator@process-many-execqueues-mmap-race-nomemset.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652"=
>Intel XE#6652</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_system_allocator@process-many-ex=
ecqueues-mmap-race-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontu=
nmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_=
system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">=
Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_system_allocator@pr=
ocess-many-stride-mmap-shared-remap-dontunmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-new-prefetch.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-164657v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-man=
y-stride-new-prefetch.html">PASS</a> +113 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-10/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_device_create.html">ABORT</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/sha=
rd-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_creat=
e.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-5/igt@xe_fault=
_injection@inject-fault-probe-function-xe_uc_fw_init.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#75=
78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
4657v2/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_uc=
_fw_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-square@render-linear-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_rende=
r_copy@render-square@render-linear-256x256.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel X=
E#6652</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-164657v2/shard-bmg-8/igt@xe_render_copy@render-square@render-linear-256x2=
56.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_big_=
fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_=
big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164=
657v2/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_bw@l=
inear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/=
igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel =
XE#7354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_ccs@=
crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/sh=
ard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887=
">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_cham=
elium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-=
bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel =
XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/ig=
t@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE=
#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_curs=
or_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7=
/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_dsc@=
dsc-with-output-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_dsc=
@dsc-with-output-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-164657v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-6=
4bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE=
#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn=
-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-=
7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v=
2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-9/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-1/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-164657v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-dow=
nscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_psr2=
_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/sha=
rd-bmg-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">=
Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_psr@=
fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_psr@=
fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shar=
d-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424"=
>Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_eudeb=
ug_online@set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_eud=
ebug_online@set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_evict=
@evict-threads-small-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/ig=
t@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1646=
57v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue-rebind-prefetch.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
64657v2/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebi=
nd-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_=
multi_queue@priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_mu=
lti_queue@priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_=
threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-164657v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-=
userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-9/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c=
69b4/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037=
995c69b4/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af4=
3037995c69b4/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb2=
3af43037995c69b4/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760=
cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886=
203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-=
773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@loa=
d.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shar=
d-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995=
c69b4/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af4303=
7995c69b4/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af=
43037995c69b4/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760c=
db23af43037995c69b4/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc=
760cdb23af43037995c69b4/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de88620=
3adcc760cdb23af43037995c69b4/shard-bmg-10/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de=
886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_module_load@load.html"=
>PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7725">Intel XE#7725</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard=
-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-164657v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-6/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-164657v2/shard-bmg-10/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v=
2/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-164657v2/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-=
bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
164657v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-3/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
164657v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_mo=
dule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-164657v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-=
bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-1/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
164657v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-1/igt@xe_module_load@load.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7405">Intel XE#7405</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2245">Intel XE#2245</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_peer2=
peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg=
-7/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#732=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353=
">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_pxp@p=
xp-termination-key-update-post-rpm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/=
igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Inte=
l XE#7417</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4896-773e7de886203adcc760cdb23af43037995c69b4 -&gt; xe-pw-164=
657v2</li>
</ul>
<p>IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4896-773e7de886203adcc760cdb23af43037995c69b4: 773e7de886203adcc760cdb=
23af43037995c69b4<br />
  xe-pw-164657v2: 164657v2</p>

</body>
</html>

--===============7296587921536427543==--
