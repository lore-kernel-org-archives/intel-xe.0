Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9817C624DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 03:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F8110E07F;
	Fri,  4 Sep 2026 03:21:15 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C11510E07F;
 Fri,  4 Sep 2026 03:21:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6443192833238310407=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Intel_Xe_GPU_Debug_Support?=
 =?utf-8?q?_=28eudebug=29_v10?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 03:21:13 -0000
Message-ID: <178849207343.121713.17339706993916818869@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

--===============6443192833238310407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe GPU Debug Support (eudebug) v10
URL   : https://patchwork.freedesktop.org/series/173321/
State : failure

== Summary ==

CI Bug Log - changes from xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34_FULL -> xe-pw-173321v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-173321v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-173321v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-173321v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-3.html

  
New tests
---------

  New tests have been introduced between xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34_FULL and xe-pw-173321v1_FULL:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_eudebug@toggle_reg:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.23] s

  

Known issues
------------

  Here are the changes found in xe-pw-173321v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-with-load:
    - shard-lnl:          [PASS][3] -> [ABORT][4] ([Intel XE#8007]) +19 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@core_hotunplug@hotreplug-with-load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@core_hotunplug@hotreplug-with-load.html

  * igt@fbdev@pan:
    - shard-lnl:          [PASS][5] -> [SKIP][6] ([Intel XE#2134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@fbdev@pan.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@fbdev@pan.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#3279])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#7059] / [Intel XE#7085])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7679])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][14] ([Intel XE#7084] / [Intel XE#8150])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3432])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#306] / [Intel XE#7358])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2252])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#373])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-lnl:          [PASS][20] -> [SKIP][21] ([Intel XE#3297])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_color@ctm-blue-to-red.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [PASS][22] -> [SKIP][23] ([Intel XE#1511] / [Intel XE#3297])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_color@deep-color.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d:
    - shard-lnl:          [PASS][24] -> [SKIP][25] ([Intel XE#7006]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2320]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1424]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-lnl:          [PASS][29] -> [SKIP][30] ([Intel XE#9125]) +28 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
    - shard-bmg:          [PASS][31] -> [FAIL][32] ([Intel XE#7809])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_aux_dev@basic:
    - shard-lnl:          [PASS][33] -> [SKIP][34] ([Intel XE#3009])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_dp_aux_dev@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#8265])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4156] / [Intel XE#7425])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-lnl:          [PASS][37] -> [SKIP][38] ([Intel XE#8680])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_fbcon_fbt@psr.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#702] / [Intel XE#7344])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#8586])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#301])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-lnl:          [PASS][45] -> [SKIP][46] ([Intel XE#2482]) +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_flip@flip-vs-rmfb.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7178] / [Intel XE#7351])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-lnl:          [PASS][48] -> [SKIP][49] ([Intel XE#1745])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7178] / [Intel XE#7351])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4141]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          [PASS][53] -> [SKIP][54] ([Intel XE#2548] / [Intel XE#7779]) +9 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#6312]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#7905]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2311]) +11 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7061])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7865])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw:
    - shard-bmg:          [PASS][60] -> [DMESG-WARN][61] ([Intel XE#7774])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          [PASS][62] -> [SKIP][63] ([Intel XE#7779])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#656] / [Intel XE#7905]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2313]) +8 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#6900] / [Intel XE#7362])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#7283]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7283])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][70] -> [INCOMPLETE][71] ([Intel XE#6819]) +1 other test incomplete
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:
    - shard-lnl:          [PASS][72] -> [SKIP][73] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-lnl:          [PASS][74] -> [SKIP][75] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          [PASS][76] -> [SKIP][77] ([Intel XE#870])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_pm_backlight@basic-brightness.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7794])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [PASS][79] -> [SKIP][80] ([Intel XE#7106])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_pm_rpm@drm-resources-equal.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#4608])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#4608] / [Intel XE#7304])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#1489]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#2893] / [Intel XE#7304])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-lnl:          [PASS][85] -> [SKIP][86] ([Intel XE#1489])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#7345])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1406])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [PASS][91] -> [SKIP][92] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_psr@psr2-sprite-plane-onoff.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2330] / [Intel XE#5813])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#6503])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1499]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_vrr@flip-dpms.html

  * igt@runner@aborted:
    - shard-lnl:          NOTRUN -> [FAIL][96] ([Intel XE#8990])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-5/igt@runner@aborted.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-bmg:          NOTRUN -> [ABORT][97] ([Intel XE#8868])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][98] -> [INCOMPLETE][99] ([Intel XE#6321] / [Intel XE#8355])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#7482]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#8374]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#8374])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#8364]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#8364]) +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_exec_multi_queue@max-queues-preempt-mode-priority-smem.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#6196])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#8378])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#8378]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-mixed-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][110] -> [ABORT][111] ([Intel XE#8007]) +21 other tests abort
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#6964])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2284] / [Intel XE#7370])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-lnl:          NOTRUN -> [ABORT][115] ([Intel XE#8007])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-bmg:          NOTRUN -> [ABORT][116] ([Intel XE#8007]) +2 other tests abort
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#944])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#944])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#7174])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          [INCOMPLETE][120] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-lnl:          [SKIP][122] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][123] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-lnl:          [SKIP][124] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-3/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-lnl:          [SKIP][126] ([Intel XE#9125]) -> [PASS][127] +6 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_sharpness_filter@filter-suspend.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_sharpness_filter@filter-suspend.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [ABORT][128] ([Intel XE#8007]) -> [PASS][129] +2 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          [SKIP][130] ([Intel XE#2833]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@xe_live_ktest@xe_eudebug.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html
    - shard-bmg:          [SKIP][132] ([Intel XE#2833]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [SKIP][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-10/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-5/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-5/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-10/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-3/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-5/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-3/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-7/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-7/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-8/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-8/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-6/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-6/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-2/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-2/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-2/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-1/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-9/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-9/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-9/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-1/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-3/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-7/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-6/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-10/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-3/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-10/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-2/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-2/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-9/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-8/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-10/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-8/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-7/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-7/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-8/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-6/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          [SKIP][185] ([Intel XE#1407]) -> [SKIP][186] ([Intel XE#9125]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][187] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][188] ([Intel XE#9125])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          [SKIP][189] ([Intel XE#9125]) -> [SKIP][190] ([Intel XE#1407])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][191] ([Intel XE#1124]) -> [SKIP][192] ([Intel XE#9125]) +5 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          [SKIP][193] ([Intel XE#9125]) -> [SKIP][194] ([Intel XE#1124])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][195] ([Intel XE#7679]) -> [SKIP][196] ([Intel XE#9125]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][197] ([Intel XE#2669] / [Intel XE#7389]) -> [SKIP][198] ([Intel XE#9125])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][199] ([Intel XE#9125]) -> [SKIP][200] ([Intel XE#2887])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][201] ([Intel XE#2887]) -> [SKIP][202] ([Intel XE#9125]) +10 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][203] ([Intel XE#307] / [Intel XE#6974]) -> [SKIP][204] ([Intel XE#9125])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_content_protection@dp-mst-type-1.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          [SKIP][205] ([Intel XE#7642]) -> [SKIP][206] ([Intel XE#9125])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_content_protection@srm.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          [SKIP][207] ([Intel XE#9125]) -> [SKIP][208] ([Intel XE#7642])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_content_protection@type1.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          [SKIP][209] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][210] ([Intel XE#9125]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          [SKIP][211] ([Intel XE#1424]) -> [SKIP][212] ([Intel XE#9125]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-lnl:          [SKIP][213] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][214] ([Intel XE#9125]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [SKIP][215] ([Intel XE#323] / [Intel XE#6035]) -> [SKIP][216] ([Intel XE#9125])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          [SKIP][217] ([Intel XE#8265]) -> [SKIP][218] ([Intel XE#9125]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][219] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385]) -> [SKIP][220] ([Intel XE#1745])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          [SKIP][221] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][222] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-lnl:          [SKIP][223] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][224] ([Intel XE#2548] / [Intel XE#7779]) +22 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][225] ([Intel XE#7779]) -> [SKIP][226] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][227] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][228] ([Intel XE#2548] / [Intel XE#7779]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          [SKIP][229] ([Intel XE#6312]) -> [SKIP][230] ([Intel XE#7779]) +6 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:
    - shard-lnl:          [SKIP][231] ([Intel XE#7779]) -> [SKIP][232] ([Intel XE#7865]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][233] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][234] ([Intel XE#656] / [Intel XE#7905]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move:
    - shard-lnl:          [SKIP][235] ([Intel XE#7779]) -> [SKIP][236] ([Intel XE#7905]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][237] ([Intel XE#7905]) -> [SKIP][238] ([Intel XE#7779]) +26 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-lnl:          [SKIP][239] ([Intel XE#7865]) -> [SKIP][240] ([Intel XE#7779]) +13 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][241] ([Intel XE#7061]) -> [SKIP][242] ([Intel XE#7779]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][243] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][244] ([Intel XE#7779])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][245] ([Intel XE#1503]) -> [SKIP][246] ([Intel XE#9125])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_hdr@invalid-metadata-sizes.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-lnl:          [SKIP][247] ([Intel XE#6912] / [Intel XE#7375]) -> [SKIP][248] ([Intel XE#9125])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          [SKIP][249] ([Intel XE#4596] / [Intel XE#5854]) -> [SKIP][250] ([Intel XE#9125])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-y.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-lnl:          [SKIP][251] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][252] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][253] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][254] ([Intel XE#1489]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][255] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][256] ([Intel XE#1489])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][257] ([Intel XE#1489]) -> [SKIP][258] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          [SKIP][259] ([Intel XE#1128] / [Intel XE#7413]) -> [SKIP][260] ([Intel XE#1122] / [Intel XE#7429])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_psr2_su@page_flip-nv12.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-lnl:          [SKIP][261] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][262] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_psr@fbc-psr2-no-drrs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          [SKIP][263] ([Intel XE#1406]) -> [SKIP][264] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_psr@pr-sprite-render.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-lnl:          [SKIP][265] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][266] ([Intel XE#9125])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          [SKIP][267] ([Intel XE#9125]) -> [SKIP][268] ([Intel XE#362] / [Intel XE#5848])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-bmg:          [SKIP][269] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][270] ([Intel XE#2509] / [Intel XE#7437])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_configfs@survivability-mode:
    - shard-lnl:          [SKIP][271] ([Intel XE#8428]) -> [ABORT][272] ([Intel XE#8007])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-3/igt@xe_configfs@survivability-mode.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@xe_configfs@survivability-mode.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-lnl:          [DMESG-WARN][273] ([Intel XE#9130]) -> [ABORT][274] ([Intel XE#8007] / [Intel XE#9140])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-1/igt@xe_exec_reset@gt-reset-fault-injection.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-2/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [ABORT][275] ([Intel XE#8963]) -> [DMESG-WARN][276] ([Intel XE#8963])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@xe_wedged@basic-wedged.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8428
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#8990]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8990
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34 -> xe-pw-173321v1

  IGT_9082: 2d61f578d998115259b87f9fa27f597ce11a0c89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34: 76a34199970d93cfb3ed5dbbd745c23b6f0cff34
  xe-pw-173321v1: 173321v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/index.html

--===============6443192833238310407==
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
<tr><td><b>Series:</b></td><td>Intel Xe GPU Debug Support (eudebug) v10</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/173321/">https://patchwork.freedesktop.org/series/173321/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-173321v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173321v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5686-76a34199970d93cfb3ed5dbbd745c23b6=
f0cff34_FULL -&gt; xe-pw-173321v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-173321v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-173321v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1733=
21v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-3:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@kms_vbla=
nk@ts-continuation-suspend@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-7/igt@km=
s_vblank@ts-continuation-suspend@pipe-a-hdmi-a-3.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5686-76a34199970d93cfb3ed5dbbd=
745c23b6f0cff34_FULL and xe-pw-173321v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_eudebug@toggle_reg:<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.23] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173321v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-with-load:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@core_hot=
unplug@hotreplug-with-load.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@core_hotunplug@hot=
replug-with-load.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +19 other tests abort</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@fbdev@pa=
n.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-173321v1/shard-lnl-6/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-2-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-til=
ed-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_ccs@random-ccs-data-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_chamelium_frames@dp-crc-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_colo=
r@ctm-blue-to-red.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_color@ctm-blue-to-red.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3297">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_colo=
r@deep-color.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511">I=
ntel XE#1511</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3297">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_colo=
r_pipeline@plane-ctm3x4-lut1d.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_color_pipel=
ine@plane-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other=
 test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscre=
en-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +28 other tests ski=
p</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-7/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_dp_a=
ux_dev@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_dp_aux_dev@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">I=
ntel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">I=
ntel XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_fbco=
n_fbt@psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel X=
E#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/702">Intel XE#702</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_feature_discovery@vrr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_flip=
@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_flip@flip-vs-rmfb.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482"=
>Intel XE#2482</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#73=
51</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-l=
nl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-l=
nl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7779">Intel XE#7779</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-rend=
er:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
srhdr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcp=
srhdr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@hdr-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@k=
ms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE=
#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard=
-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psrh=
dr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_plane@pixel-format-4-tile=
d-dg2-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-3/igt@kms_plane_multiple@=
2x-tiling-none.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6819">Intel XE#6819</a>) +1 other test incomplete<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/s=
hard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers=
@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687"=
>Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_pm_b=
acklight@basic-brightness.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_pm_backlight@ba=
sic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">I=
ntel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_pm_r=
pm@drm-resources-equal.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_pm_rpm@drm-resourc=
es-equal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7106">Intel XE#7106</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#73=
04</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_psr2_sf@pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_psr2=
_sf@psr2-primary-plane-update-sf-dmg-area.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms=
_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-page=
-flip@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@kms_psr@pr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@kms_psr@psr2-primary-page-fli=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_psr@=
psr2-sprite-plane-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_psr@psr2-sprite-p=
lane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_sharpness_filter@invalid-=
filter-with-nearest-neighbor.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@kms_vrr@flip-dpms.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">I=
ntel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-5/igt@runner@aborted.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8990">Inte=
l XE#8990</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@sriov_basic@pf-unbind-with-vf=
s-enabled-numvfs-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-5/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_evict@evict-beng-threads-l=
arge-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_exec_balancer@no-exec-cm-p=
arallel-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi=
-queue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-invalid-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_exec_fault_mode@twice-mult=
i-queue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vm=
a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-comp-single-vma.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_exec_threads@threads-multi=
-queue-cm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_exec_threads@threads-multi=
-queue-mixed-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-1/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/sha=
rd-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_ea=
rly.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8007">Intel XE#8007</a>) +21 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_mmap@pci-membarrier-bad-ob=
ject.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7322">Intel XE#7322</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-xgpu-acc=
ess-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_pm@s2idle-basic-exec.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@xe_pm@s2idle-exec-after.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8007">Intel XE#8007</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_sriov_admin@bulk-sched-pri=
ority-vfs-disabled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#70=
84</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/815=
0">Intel XE#8150</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-173321v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-b=
mg-ccs@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7=
779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
73321v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_plan=
e_scaling@invalid-num-scalers.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel X=
E#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-173321v1/shard-lnl-3/igt@kms_plane_scaling@invalid-num-scalers.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_shar=
pness_filter@filter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms=
_sharpness_filter@filter-suspend.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-5/igt@xe_fault=
_injection@vm-create-fail-xe_vm_create_scratch.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1=
/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.htm=
l">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-3/igt@xe_live_ktest@=
xe_eudebug.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-1/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-6/igt@xe_live_ktest@=
xe_eudebug.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-=
10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard=
-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/s=
hard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff=
34/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f=
0cff34/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c2=
3b6f0cff34/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd7=
45c23b6f0cff34/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5=
dbbd745c23b6f0cff34/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb=
3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d9=
3cfb3ed5dbbd745c23b6f0cff34/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a341999=
70d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34=
199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5686-7=
6a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-56=
86-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/sha=
rd-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34=
/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0c=
ff34/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#=
7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173321v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173321v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard=
-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173321v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173321v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shar=
d-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-10/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173321v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-173321v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/sha=
rd-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-5/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173321v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-173321v1/shard-bmg-10/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-173321v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-173321v1/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_big_=
fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_b=
ig_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_big_=
fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Inte=
l XE#7085</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-173321v1/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_big_=
fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-3/igt@kms_=
big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel =
XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173321v1/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-1=
80-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#91=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
3321v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_bw@c=
onnected-linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1733=
21v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_ccs@=
crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1=
/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/sha=
rd-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">=
Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_ccs@=
missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shar=
d-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">In=
tel XE#9125</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-=
lnl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_cont=
ent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@kms_conten=
t_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_curs=
or_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/sh=
ard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#912=
5</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_curs=
or_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6=
/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/=
shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel X=
E#323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6035">Intel XE#6035</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-b=
efore-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms=
_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel X=
E#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7385">Intel XE#7385</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_flip_scaled_crc@=
flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#=
2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173321v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-pri=
mscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/790=
5">Intel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scnds=
crn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +22 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/s=
hard-lnl-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
61">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#63=
12</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651=
">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-prim=
scrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#=
6312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-sp=
r-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7779">Intel XE#7779</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/=
shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel X=
E#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173321v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#77=
79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
3321v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-i=
ndfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#=
7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-ind=
fb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7779">Intel XE#7779</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/=
igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)=
 +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/sh=
ard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779=
">Intel XE#7779</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel=
 XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-173321v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-=
mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_pipe=
_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/s=
hard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-=
6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel =
XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173321v1/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@p=
ipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-2/igt@kms_psr2=
_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE=
#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7304">Intel XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel=
 XE#4608</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7304">Intel XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1=
/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/ig=
t@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_psr@=
fbc-psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/ig=
t@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@kms_psr@=
pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_psr@pr-spr=
ite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-4/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#390=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342=
">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-173321v1/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-refle=
ct-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-6/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/sha=
rd-lnl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">I=
ntel XE#362</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5848">Intel XE#5848</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-173321v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-3/igt@xe_confi=
gfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8428">Intel XE#8428</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-8/igt@xe_confi=
gfs@survivability-mode.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-1/igt@xe_exec_=
reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-=
2/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140">Intel=
 XE#9140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34/shard-lnl-8/igt@xe_wedge=
d@basic-wedged.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-173321v1/shard-lnl-7/igt@xe_wedged@basic=
-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34 -&gt; xe-pw-173=
321v1</li>
</ul>
<p>IGT_9082: 2d61f578d998115259b87f9fa27f597ce11a0c89 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5686-76a34199970d93cfb3ed5dbbd745c23b6f0cff34: 76a34199970d93cfb3ed5db=
bd745c23b6f0cff34<br />
  xe-pw-173321v1: 173321v1</p>

</body>
</html>

--===============6443192833238310407==--
