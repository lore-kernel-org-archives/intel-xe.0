Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECBFC79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 15:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AE810E86B;
	Mon,  7 Sep 2026 15:10:13 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A39E10E4B0;
 Mon,  7 Sep 2026 15:10:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8750085800097414352=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Add_multi=5Fqueu?=
 =?utf-8?q?e=5Factive=5Flrca_debugfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Sep 2026 15:10:12 -0000
Message-ID: <178879381254.130176.4558950715131642696@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907120223.990784-2-varun.gupta@intel.com>
In-Reply-To: <20260907120223.990784-2-varun.gupta@intel.com>
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

--===============8750085800097414352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add multi_queue_active_lrca debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/173220/
State : success

== Summary ==

CI Bug Log - changes from xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db_FULL -> xe-pw-173220v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db_FULL and xe-pw-173220v2_FULL:

### New IGT tests (16) ###

  * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.20] s

  * igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.21] s

  * igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.21] s

  * igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [9.19] s

  * igt@kms_plane_multiple@tiling-4:
    - Statuses : 1 pass(s)
    - Exec time: [7.19] s

  * igt@kms_plane_multiple@tiling-none:
    - Statuses : 2 pass(s)
    - Exec time: [7.28, 13.91] s

  * igt@kms_plane_multiple@tiling-none@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.12] s

  * igt@kms_plane_multiple@tiling-none@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.88] s

  * igt@kms_plane_multiple@tiling-none@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.87] s

  * igt@kms_plane_multiple@tiling-x:
    - Statuses : 2 pass(s)
    - Exec time: [8.48, 13.92] s

  * igt@kms_plane_multiple@tiling-x@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.14] s

  * igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.86] s

  * igt@kms_plane_multiple@tiling-x@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.88] s

  * igt@kms_plane_multiple@tiling-y:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_plane_multiple@tiling-yf:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@xe_pm:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-173220v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - shard-lnl:          [PASS][1] -> [SKIP][2] ([Intel XE#2134])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@fbdev@eof.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@fbdev@eof.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1407]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#3658] / [Intel XE#7360])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +8 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7679]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +9 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#3432])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +6 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#7008])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2325] / [Intel XE#7358])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#306] / [Intel XE#7358]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7358])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#373]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [PASS][20] -> [SKIP][21] ([Intel XE#1511] / [Intel XE#3297])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_color@deep-color.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#7006])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_color_pipeline@plane-ctm3x4.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d:
    - shard-lnl:          [PASS][23] -> [SKIP][24] ([Intel XE#7006]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_color_pipeline@plane-lut1d-lut1d.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#6974]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2320]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1424]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2321] / [Intel XE#7355])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-tearing-position-change:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#9125]) +32 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_cursor_crc@cursor-tearing-position-change.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#309] / [Intel XE#7343]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#4331] / [Intel XE#7227])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#8265])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#8265]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4422] / [Intel XE#7442])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4156] / [Intel XE#7425])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#8680])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1137] / [Intel XE#2375])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#8586])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@hdr:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#8586])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2374] / [Intel XE#6128])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1421]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-lnl:          [PASS][43] -> [SKIP][44] ([Intel XE#2482]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_flip@basic-flip-vs-modeset.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-lnl:          [PASS][45] -> [SKIP][46] ([Intel XE#9132])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_flip@flip-vs-dpms-on-nop.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7179])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-lnl:          [PASS][50] -> [SKIP][51] ([Intel XE#1745] / [Intel XE#9144]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7178] / [Intel XE#7349])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1745] / [Intel XE#9144])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#352])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#656] / [Intel XE#7905]) +21 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7061]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#4141]) +11 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7779]) +24 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#7061] / [Intel XE#7356])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2548] / [Intel XE#7779]) +18 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2311]) +30 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7905]) +19 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#6312]) +7 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#7865]) +14 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2313]) +34 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-lnl:          [PASS][69] -> [SKIP][70] ([Intel XE#2548] / [Intel XE#7779]) +13 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-lnl:          [PASS][71] -> [SKIP][72] ([Intel XE#7779]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#7061]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#2568])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-lnl:          [PASS][76] -> [SKIP][77] ([Intel XE#2568])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_invalid_mode@zero-hdisplay.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7086] / [Intel XE#7390])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#6911] / [Intel XE#7466])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#4298] / [Intel XE#5873])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_lease@lease-unleased-crtc:
    - shard-lnl:          [PASS][81] -> [SKIP][82] ([Intel XE#9125]) +33 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_lease@lease-unleased-crtc.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_lease@lease-unleased-crtc.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-lnl:          [PASS][84] -> [SKIP][85] ([Intel XE#7250] / [Intel XE#9128])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-modifier.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#7283]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#7283]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-lnl:          [PASS][88] -> [SKIP][89] ([Intel XE#7780] / [Intel XE#9125])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plane@planar-pixel-format-settings.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-lnl:          [PASS][90] -> [SKIP][91] ([Intel XE#9128])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plane@plane-panning-top-left.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#9128]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_multiple@tiling-yf (NEW):
    - shard-lnl:          [SKIP][93] ([Intel XE#9125]) -> [SKIP][94] ([Intel XE#5020] / [Intel XE#7348])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-lnl:          [PASS][95] -> [SKIP][96] ([Intel XE#2763] / [Intel XE#6886]) +5 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:
    - shard-lnl:          [PASS][97] -> [SKIP][98] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +5 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#2763] / [Intel XE#6886]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-lnl:          [PASS][102] -> [SKIP][103] ([Intel XE#870])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_pm_backlight@bad-brightness.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][105] ([Intel XE#8399])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1131])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#7794])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][108] -> [FAIL][109] ([Intel XE#8399])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [PASS][110] -> [SKIP][111] ([Intel XE#7106])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_pm_rpm@drm-resources-equal.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1489])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4608])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#4608] / [Intel XE#7304])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#1489]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [PASS][120] -> [SKIP][121] ([Intel XE#1489]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1406] / [Intel XE#7345]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1406])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-lnl:          [PASS][127] -> [SKIP][128] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_psr@psr-sprite-plane-onoff.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [PASS][129] -> [SKIP][130] ([Intel XE#7795])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2330] / [Intel XE#5813])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [PASS][133] -> [SKIP][134] ([Intel XE#1435] / [Intel XE#9142])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_setmode@basic.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1435] / [Intel XE#9142])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#6503]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#362] / [Intel XE#5848])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#330] / [Intel XE#5857])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#7638])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1499]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#7644])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#6540] / [Intel XE#688]) +5 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#8370])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#7482]) +15 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_exec_balancer@no-exec-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#1392]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#8374]) +7 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#8374]) +9 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#8364]) +19 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#8364]) +21 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_exec_multi_queue@two-queues-close-fd-smem.html

  * igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][151] ([Intel XE#9041])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#8369]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#8369]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#8378]) +8 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#8378]) +5 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
    - shard-bmg:          [PASS][156] -> [ABORT][157] ([Intel XE#8007])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178]) -> ([PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [SKIP][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200]) ([Intel XE#378] / [Intel XE#7405])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-1/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-5/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-7/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-7/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-7/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-5/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-5/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-3/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-5/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-5/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-2/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-2/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-2/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-3/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#6964]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#6964])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#7793])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-lnl:          NOTRUN -> [FAIL][204] ([Intel XE#7695])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#7590]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm (NEW):
    - shard-bmg:          NOTRUN -> [INCOMPLETE][206] ([Intel XE#2594])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-8/igt@xe_pm.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#584] / [Intel XE#7369])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#7271])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_prefetch_fault@l2-prefetch-fault:
    - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#8815])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_prefetch_fault@l2-prefetch-fault.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#944])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#944]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#7174])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#3342])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@equal-throughput-low-priority:
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#8339])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_sriov_scheduling@equal-throughput-low-priority.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][217] ([Intel XE#8963])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [ABORT][218] ([Intel XE#8007]) -> [PASS][219] +1 other test pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-bmg-3/igt@core_hotunplug@hotrebind-lateclose.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_color@gamma:
    - shard-lnl:          [SKIP][220] ([Intel XE#3297]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_color@gamma.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_color@gamma.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][222] ([Intel XE#7809]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [FAIL][224] ([Intel XE#7949] / [i915#4767]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][226] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-lnl:          [SKIP][228] ([Intel XE#2482]) -> [PASS][229] +2 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-lnl:          [SKIP][230] ([Intel XE#1745] / [Intel XE#9144]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][232] ([Intel XE#7779]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          [SKIP][234] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][235] +6 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-lnl:          [SKIP][236] ([Intel XE#2568]) -> [PASS][237] +1 other test pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_invalid_mode@bad-vtotal.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-lnl:          [SKIP][238] ([Intel XE#9128]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
    - shard-lnl:          [SKIP][240] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][241] +3 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-lnl:          [SKIP][242] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][243] +3 other tests pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          [SKIP][244] ([Intel XE#870]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_pm_backlight@fade-with-dpms.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-lnl:          [FAIL][246] ([Intel XE#8399]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-lnl:          [SKIP][248] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-lnl:          [SKIP][250] ([Intel XE#9129]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_properties@plane-properties-legacy.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-lnl:          [SKIP][252] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][253] +2 other tests pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][254] ([Intel XE#7795]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][256] ([Intel XE#9125]) -> [PASS][257] +26 other tests pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [FAIL][258] ([Intel XE#9096]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          [SKIP][260] ([Intel XE#3279]) -> [SKIP][261] ([Intel XE#9125])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][262] ([Intel XE#1407]) -> [SKIP][263] ([Intel XE#9125]) +5 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][264] ([Intel XE#9125]) -> [SKIP][265] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          [SKIP][266] ([Intel XE#9125]) -> [SKIP][267] ([Intel XE#1407])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          [SKIP][268] ([Intel XE#1124]) -> [SKIP][269] ([Intel XE#9125]) +8 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][270] ([Intel XE#9125]) -> [SKIP][271] ([Intel XE#1477] / [Intel XE#7361])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          [SKIP][272] ([Intel XE#9125]) -> [SKIP][273] ([Intel XE#1124]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][274] ([Intel XE#9125]) -> [SKIP][275] ([Intel XE#7679])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][276] ([Intel XE#7679]) -> [SKIP][277] ([Intel XE#9125])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][278] ([Intel XE#8365]) -> [SKIP][279] ([Intel XE#9125]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][280] ([Intel XE#367]) -> [SKIP][281] ([Intel XE#9125])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][282] ([Intel XE#9125]) -> [SKIP][283] ([Intel XE#367])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][284] ([Intel XE#2887]) -> [SKIP][285] ([Intel XE#9125]) +10 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          [SKIP][286] ([Intel XE#9125]) -> [SKIP][287] ([Intel XE#2887]) +8 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          [SKIP][288] ([Intel XE#9125]) -> [SKIP][289] ([Intel XE#3432])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          [SKIP][290] ([Intel XE#3432]) -> [SKIP][291] ([Intel XE#9125]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          [SKIP][292] ([Intel XE#307] / [Intel XE#6974]) -> [SKIP][293] ([Intel XE#9125])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-1.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          [SKIP][294] ([Intel XE#9125]) -> [SKIP][295] ([Intel XE#307] / [Intel XE#6974])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          [SKIP][296] ([Intel XE#9125]) -> [SKIP][297] ([Intel XE#7642]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_content_protection@lic-type-1.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          [SKIP][298] ([Intel XE#7642]) -> [SKIP][299] ([Intel XE#9125]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_content_protection@srm.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          [SKIP][300] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][301] ([Intel XE#9125])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          [SKIP][302] ([Intel XE#9125]) -> [SKIP][303] ([Intel XE#1424]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          [SKIP][304] ([Intel XE#1424]) -> [SKIP][305] ([Intel XE#9125]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          [SKIP][306] ([Intel XE#9125]) -> [SKIP][307] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][308] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][309] ([Intel XE#9125])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][310] ([Intel XE#323] / [Intel XE#6035]) -> [SKIP][311] ([Intel XE#9125])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          [SKIP][312] ([Intel XE#9125]) -> [SKIP][313] ([Intel XE#4354] / [Intel XE#5882])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][314] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][315] ([Intel XE#9125])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_dp_link_training@uhbr-mst.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-lnl:          [SKIP][316] ([Intel XE#9125]) -> [SKIP][317] ([Intel XE#8265]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          [SKIP][318] ([Intel XE#8265]) -> [SKIP][319] ([Intel XE#9125]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][320] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][321] ([Intel XE#301])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][322] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) -> [SKIP][323] ([Intel XE#1745] / [Intel XE#9144]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][324] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][325] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][326] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][327] ([Intel XE#6312] / [Intel XE#651]) +6 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][328] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][329] ([Intel XE#7779]) +3 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][330] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][331] ([Intel XE#2548] / [Intel XE#7779]) +33 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][332] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][333] ([Intel XE#2548] / [Intel XE#7779]) +7 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][334] ([Intel XE#6312]) -> [SKIP][335] ([Intel XE#7779]) +6 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:
    - shard-lnl:          [SKIP][336] ([Intel XE#7779]) -> [SKIP][337] ([Intel XE#6312]) +10 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][338] ([Intel XE#7905]) -> [SKIP][339] ([Intel XE#7779]) +34 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][340] ([Intel XE#7779]) -> [SKIP][341] ([Intel XE#7061]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-lnl:          [SKIP][342] ([Intel XE#7779]) -> [SKIP][343] ([Intel XE#7865]) +12 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-lnl:          [SKIP][344] ([Intel XE#7399]) -> [SKIP][345] ([Intel XE#7779])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][346] ([Intel XE#7865]) -> [SKIP][347] ([Intel XE#7779]) +21 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][348] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][349] ([Intel XE#656] / [Intel XE#7905]) +18 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-lnl:          [SKIP][350] ([Intel XE#7779]) -> [SKIP][351] ([Intel XE#7905]) +22 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][352] ([Intel XE#7061]) -> [SKIP][353] ([Intel XE#7779]) +5 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-lnl:          [SKIP][354] ([Intel XE#599] / [Intel XE#7382]) -> [SKIP][355] ([Intel XE#9125])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plane_lowres@tiling-none.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-lnl:          [SKIP][356] ([Intel XE#4596] / [Intel XE#5854]) -> [SKIP][357] ([Intel XE#9125])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          [SKIP][358] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][359] ([Intel XE#7343] / [Intel XE#7687] / [Intel XE#9125])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          [SKIP][360] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][361] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +3 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][362] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][363] ([Intel XE#1489]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][364] ([Intel XE#1489]) -> [SKIP][365] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][366] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][367] ([Intel XE#1489]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          [SKIP][368] ([Intel XE#1122] / [Intel XE#7429]) -> [SKIP][369] ([Intel XE#1128] / [Intel XE#7413])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_psr2_su@page_flip-p010.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          [SKIP][370] ([Intel XE#1406]) -> [SKIP][371] ([Intel XE#2850] / [Intel XE#929])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_psr@fbc-pr-dpms.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-lnl:          [SKIP][372] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][373] ([Intel XE#1406]) +3 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_psr@fbc-pr-no-drrs.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          [SKIP][374] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][375] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_psr@fbc-psr2-dpms.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          [SKIP][376] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][377] ([Intel XE#9125]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_rotation_crc@primary-rotation-270.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][378] ([Intel XE#9125]) -> [SKIP][379] ([Intel XE#1499])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [ABORT][380] ([Intel XE#9131] / [Intel XE#9145]) -> [DMESG-WARN][381] ([Intel XE#9130])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-bmg-10/igt@xe_exec_reset@gt-reset-fault-injection.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_exec_reset@gt-reset-fault-injection.html

  
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
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
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9041
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131
  [Intel XE#9132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767


Build changes
-------------

  * Linux: xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db -> xe-pw-173220v2

  IGT_9084: 9084
  xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db: c60540b13d7bacc21848ed94fd368a968454d5db
  xe-pw-173220v2: 173220v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/index.html

--===============8750085800097414352==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add multi_queue_active_lrca debugfs =
(rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/173220/">https://patchwork.freedesktop.org/series/173220/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-173220v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173220v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5697-c60540b13d7bacc21848ed94fd368a968=
454d5db_FULL -&gt; xe-pw-173220v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5697-c60540b13d7bacc21848ed94f=
d368a968454d5db_FULL and xe-pw-173220v2_FULL:</p>
<h3>New IGT tests (16)</h3>
<ul>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.28, 13.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.48, 13.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_pm:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173220v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@fbdev@eo=
f.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-173220v2/shard-lnl-6/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_big_fb@4-tiled-32bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_bw@linear-tiling-2-displ=
ays-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7008">Intel XE#7008</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_chamelium_audio@dp-audio-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_chamelium_color_pipeline=
@plane-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-wi=
th-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_colo=
r@deep-color.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511">I=
ntel XE#1511</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3297">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_color_pipeline@plane-ctm3=
x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_colo=
r_pipeline@plane-lut1d-lut1d.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_color_pipeli=
ne@plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_content_protection@dp-mst=
-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_cursor_crc@cursor-onscre=
en-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_cursor_crc@cursor-onscree=
n-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-position-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_cursor_crc@cursor-tearing=
-position-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9125">Intel XE#9125</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-=
flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_dsc@dsc-with-formats-bigj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_fbcon_fbt@fbc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">I=
ntel XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1137">Intel XE#1137</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_feature_discovery@dsc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_feature_discovery@hdr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_flip@2x-nonexisting-fb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_flip=
@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_flip@basic-flip-vs=
-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_flip=
@flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on=
-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9132">Intel XE#9132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">In=
tel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-l=
nl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9144">Intel XE#9144</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +21 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
hdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-=
abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +24 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#777=
9</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-blt:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +30 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +19 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbch=
dr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +14 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +34 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/ig=
t@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE=
#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7779">Intel XE#7779</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard=
-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7779">Intel XE#7779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psrh=
dr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_invalid_mode@bad-vsync-en=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_inva=
lid_mode@zero-hdisplay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_invalid_mode@zero-=
hdisplay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_joiner@basic-force-big-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7086">Intel XE#7086</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7390">Intel XE#7390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_leas=
e@lease-unleased-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_lease@lease-unlease=
d-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9125">Intel XE#9125</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8=
888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_plan=
e@pixel-format-4-tiled-modifier.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane@pix=
el-format-4-tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_plane@pixel-format-y-tile=
d-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_plane@pixel-format-y-tile=
d-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plan=
e@planar-pixel-format-settings.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane@plan=
ar-pixel-format-settings.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7780">Intel XE#7780</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plan=
e@plane-panning-top-left.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane@plane-pann=
ing-top-left.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane@plane-position-cove=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/9128">Intel XE#9128</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf (NEW):</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_plane_=
multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/sh=
ard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@p=
ipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/sh=
ard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@p=
ipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel X=
E#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_pm_b=
acklight@bad-brightness.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_pm_backlight@bad-=
brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@kms_pm_backlight@fade-with-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">=
Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">=
Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel=
 XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_pm_r=
pm@drm-resources-equal.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_pm_rpm@drm-resourc=
es-equal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7106">Intel XE#7106</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-plane-move=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7=
304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#73=
04</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_psr2=
_sf@psr2-overlay-plane-update-sf-dmg-area.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms=
_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_psr@fbc-psr2-no-drrs@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7345">Intel XE#7345</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_psr@pr-primary-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_psr@=
psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr@psr-sprite-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@k=
ms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_setm=
ode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_setmode@basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel X=
E#1435</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_setmode@invalid-clone-sin=
gle-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@kms_sharpness_filter@invalid=
-filter-with-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@kms_vrr@lobf@pipe-a-edp-1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7638">Intel XE#7638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@kms_vrr@negative-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_ccs@vm-bind-fault-mode-dec=
ompress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_evict@evict-beng-mixed-man=
y-threads-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@xe_evict@evict-small-external=
-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_exec_balancer@no-exec-cm-p=
arallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7482">Intel XE#7482</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_exec_fault_mode@many-mult=
i-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_exec_multi_queue@many-exe=
cs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +19 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_exec_multi_queue@two-queue=
s-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8364">Intel XE#8364</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@xe_exec_reset@gt-stress-reset=
-mixed-engine-usage.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9041">Intel XE#9041</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_exec_reset@multi-queue-cl=
ose-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_exec_reset@multi-queue-gt-=
reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-1/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-bmg-6/igt@xe_fault=
_injection@exec-queue-create-fail-xe_exec_queue_create.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-=
bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-l=
nl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db=
/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454=
d5db/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a96=
8454d5db/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94fd36=
8a968454d5db/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848ed94=
fd368a968454d5db/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc21848=
ed94fd368a968454d5db/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7bacc2=
1848ed94fd368a968454d5db/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b13d7b=
acc21848ed94fd368a968454d5db/shard-lnl-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c60540b1=
3d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-c605=
40b13d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5697-=
c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17322=
0v2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173220v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_module_load@load.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17322=
0v2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173220v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17322=
0v2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173220v2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17322=
0v2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17322=
0v2/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#740=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_multigpu_svm@mgpu-migratio=
n-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_multigpu_svm@mgpu-pagefau=
lt-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_page_reclaim@prl-invalida=
te-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_pat@pat-sw-hw-compare.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@xe_pat@xa-app-transient-media=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-8/igt@xe_pm.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel X=
E#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_pm@s3-exec-after.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">=
Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_pm_residency@aspm_link_res=
idency.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7271">Intel XE#7271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_prefetch_fault@l2-prefetch=
-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@xe_sriov_admin@sched-priority=
-write-readback-vfs-disabled.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-low-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-1/igt@xe_sriov_scheduling@equal-thr=
oughput-low-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173220v2/shard-lnl-7/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-bmg-3/igt@core_hot=
unplug@hotrebind-lateclose.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-9/igt@cor=
e_hotunplug@hotrebind-lateclose.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_colo=
r@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3297">Intel XE#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_color@gamma.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-bmg-10/igt@kms_cur=
sor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-bmg-6/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@kms_fbco=
n_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7949">Intel XE#7949</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4767">i915#4767</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-5/ig=
t@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shar=
d-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_flip=
@wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/i=
gt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/914=
4">Intel XE#9144</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-t=
o-64bpp-4tile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel=
 XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-p=
ri-indfb-draw-mmap-wc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn=
-spr-indfb-draw-blt.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_inva=
lid_mode@bad-vtotal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_invalid=
_mode@bad-vtotal.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_plan=
e@plane-panning-bottom-right.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@km=
s_plane@plane-panning-bottom-right.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-=
a:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_plan=
e_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Int=
el XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_plane_scaling@plane-scaler=
-unity-scaling-with-pixel-format@pipe-a.html">PASS</a> +3 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75-unity-scaling.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886=
">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_plane_s=
caling@planes-downscale-factor-0-75-unity-scaling.html">PASS</a> +3 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_pm_ba=
cklight@fade-with-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_pm_d=
c@dc5-dpms-suspend-resume.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_p=
m_dc@dc5-dpms-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220=
v2/shard-lnl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_prop=
erties@plane-properties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9129">Intel XE#9129</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/ig=
t@kms_properties@plane-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_psr@=
fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-ln=
l-4/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">PASS</a> +2 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/sha=
rd-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_rota=
tion_crc@primary-x-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-ln=
l-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a> +26 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-1/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/sh=
ard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PA=
SS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_atom=
ic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shar=
d-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">In=
tel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2=
/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9125">Intel XE#9125</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_big_=
fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/=
shard-lnl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7085">Intel XE#7085</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_big_=
fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_=
big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_big_=
fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_b=
ig_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-ln=
l-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1=
477</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
61">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#91=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
3220v2/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1732=
20v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1732=
20v2/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1732=
20v2/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_bw@l=
inear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-l=
nl-6/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_bw@l=
inear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard=
-lnl-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel=
 XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_ccs@=
bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-ln=
l-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_ccs@=
bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/=
igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)=
 +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-ln=
l-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3=
432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-=
lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/sh=
ard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_cont=
ent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@km=
s_content_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_cont=
ent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_c=
ontent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_curs=
or_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/sh=
ard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#912=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_curs=
or_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/=
igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_curs=
or_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl=
-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#912=
5</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_curs=
or_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1732=
20v2/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-ato=
mic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel X=
E#309</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7343">Intel XE#7343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-=
atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/323">Intel XE#323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6035">Intel XE#6035</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_cursor_legacy@shor=
t-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel X=
E#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_d=
p_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6=
/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_dsc@=
dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/i=
gt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_dsc@=
dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shar=
d-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">In=
tel XE#9125</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-5=
/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7385">Intel XE#7385</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
144">Intel XE#9144</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile=
-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#=
7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#254=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779=
">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primsc=
rn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Inte=
l XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7779">Intel XE#7779</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">I=
ntel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +33 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7779">Intel XE#7779</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel=
 XE#6312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscre=
en-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2=
/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6312">Intel XE#6312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel X=
E#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-173220v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/sh=
ard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061=
">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/=
igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)=
 +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6=
/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1732=
20v2/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7779">Intel XE#7779</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn=
-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +18 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1732=
20v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7905">Intel XE#7905</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/sh=
ard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779=
">Intel XE#7779</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plan=
e_lowres@tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/ig=
t@kms_plane_lowres@tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl=
-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shar=
d-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687"=
>Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886"=
>Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor=
-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Int=
el XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608"=
>Intel XE#4608</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7304">Intel XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-curso=
r-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_psr2=
_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1732=
20v2/shard-lnl-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-ful=
ly-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#289=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304=
">Intel XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/ig=
t@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_psr@=
fbc-pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms_psr@fbc-pr-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_psr@=
fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_=
psr@fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-3/igt@kms_psr@=
fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-6/igt@kms=
_psr@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-4/igt@kms_rota=
tion_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel X=
E#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-173220v2/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">=
Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-lnl-6/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/shard-lnl-4/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db/shard-bmg-10/igt@xe_exec=
_reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9131">Intel XE#9131</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173220v2/=
shard-bmg-10/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Int=
el XE#9130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db -&gt; xe-pw-173=
220v2</li>
</ul>
<p>IGT_9084: 9084<br />
  xe-5697-c60540b13d7bacc21848ed94fd368a968454d5db: c60540b13d7bacc21848ed9=
4fd368a968454d5db<br />
  xe-pw-173220v2: 173220v2</p>

</body>
</html>

--===============8750085800097414352==--
