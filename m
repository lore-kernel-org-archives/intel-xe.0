Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0D1C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2D310E09C;
	Tue,  8 Sep 2026 06:31:02 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA7010E08F;
 Tue,  8 Sep 2026 06:31:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7341062803071903048=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_support_for_a_DRM_back?=
 =?utf-8?q?light_capability_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 06:31:01 -0000
Message-ID: <178884906149.132776.15324647535326720131@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908044035.62093-1-mario.limonciello@amd.com>
In-Reply-To: <20260908044035.62093-1-mario.limonciello@amd.com>
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

--===============7341062803071903048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for a DRM backlight capability (rev3)
URL   : https://patchwork.freedesktop.org/series/169110/
State : failure

== Summary ==

CI Bug Log - changes from xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095_FULL -> xe-pw-169110v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169110v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169110v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169110v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-3/igt@kms_pm_backlight@brightness-with-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_pm_backlight@brightness-with-dpms.html

  
Known issues
------------

  Here are the changes found in xe-pw-169110v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][3] -> [ABORT][4] ([Intel XE#8007])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-10/igt@core_hotunplug@hotrebind-lateclose.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@eof:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#2134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@fbdev@eof.html

  * igt@fbdev@unaligned-read:
    - shard-lnl:          [PASS][6] -> [SKIP][7] ([Intel XE#2134])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@fbdev@unaligned-read.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@fbdev@unaligned-read.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][10] -> [SKIP][11] ([Intel XE#9125]) +24 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7679])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#8365])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#4416] / [Intel XE#7381]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#306] / [Intel XE#7358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2325] / [Intel XE#7358])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-lnl:          [PASS][26] -> [SKIP][27] ([Intel XE#7006]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#7006])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#6974]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7642]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2320]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1424]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#309] / [Intel XE#7343])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#323] / [Intel XE#6035])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#8265]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#8265]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#9127])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][40] -> [SKIP][41] ([Intel XE#9127])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#8680])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2372] / [Intel XE#7359])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1421]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-lnl:          [PASS][45] -> [SKIP][46] ([Intel XE#2482])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_flip@flip-vs-panning-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2482]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7178] / [Intel XE#7351])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7178] / [Intel XE#7351])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1745] / [Intel XE#9144])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7178] / [Intel XE#7349])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7179])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#7905]) +21 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4141]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2352] / [Intel XE#7399])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#7061] / [Intel XE#7356])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1469] / [Intel XE#7399])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2311]) +31 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7061]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#6312]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#7399])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#656] / [Intel XE#7905]) +16 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2313]) +33 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#7779]) +25 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2548] / [Intel XE#7779]) +18 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [PASS][69] -> [SKIP][70] ([Intel XE#7779]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          [PASS][71] -> [SKIP][72] ([Intel XE#2548] / [Intel XE#7779]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#7865]) +12 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7061]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#3374] / [Intel XE#3544])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@overflow-vrefresh:
    - shard-lnl:          [PASS][77] -> [SKIP][78] ([Intel XE#2568])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_invalid_mode@overflow-vrefresh.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_invalid_mode@overflow-vrefresh.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#6900] / [Intel XE#7362])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#6911] / [Intel XE#7466])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2486])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#7250] / [Intel XE#9128])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#7283]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#7283]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#9128])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#599] / [Intel XE#7382]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#5021] / [Intel XE#7377]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#5020] / [Intel XE#7348])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2763] / [Intel XE#6886]) +5 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-lnl:          [PASS][91] -> [SKIP][92] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2763] / [Intel XE#6886]) +9 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#870])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][96] ([Intel XE#8399])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-lnl:          [PASS][98] -> [SKIP][99] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_pm_rpm@modeset-lpsp.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-lnl:          [PASS][100] -> [SKIP][101] ([Intel XE#9129])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_properties@plane-properties-legacy.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#1489]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1489]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2893] / [Intel XE#7304]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          [PASS][105] -> [SKIP][106] ([Intel XE#1489])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-lnl:          [PASS][107] -> [SKIP][108] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr@fbc-psr-primary-blt.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406] / [Intel XE#7345]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#7795])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2330] / [Intel XE#5813])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#9125]) +28 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#1499])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1447] / [Intel XE#7471])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#6599])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#8608])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#6540] / [Intel XE#688]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#7482]) +14 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1392]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#8374]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#8374]) +12 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#8364]) +21 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#8364]) +16 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#8369]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#8369]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#6196])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#8378]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#8378]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159]) -> ([PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [SKIP][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185]) ([Intel XE#2457] / [Intel XE#7405])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-3/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-9/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-2/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-1/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-10/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-9/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-7/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-7/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-1/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-3/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-6/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-2/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-10/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-4/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-10/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-4/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-6/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-7/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-5/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-10/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-10/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-1/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-5/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-1/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-6/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-6/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-9/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-9/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-8/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-8/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-9/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-7/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#6964]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_noexec_ping_pong@basic:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#6259] / [Intel XE#7324] / [Intel XE#7406])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_noexec_ping_pong@basic.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#7793]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#7793]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#1420] / [Intel XE#7590])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#2284] / [Intel XE#7370])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#7271])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#7599])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_query@multigpu-query-engines:
    - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#944])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#944]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_admin@bulk-preempt-timeout-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#7174])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_sriov_admin@bulk-preempt-timeout-vfs-disabled.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#4130] / [Intel XE#7366])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#3342])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@equal-throughput-low-priority:
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#8339])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_sriov_scheduling@equal-throughput-low-priority.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#7892]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html

  
#### Possible fixes ####

  * igt@kms_color@ctm-blue-to-red:
    - shard-lnl:          [SKIP][202] ([Intel XE#3297]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_color@ctm-blue-to-red.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - shard-lnl:          [SKIP][204] ([Intel XE#9125]) -> [PASS][205] +20 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cursor_edge_walk@64x64-top-edge.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_cursor_edge_walk@64x64-top-edge.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-lnl:          [SKIP][206] ([Intel XE#2482]) -> [PASS][207] +3 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][208] ([Intel XE#7779]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-lnl:          [SKIP][210] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][211] +3 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-lnl:          [SKIP][212] ([Intel XE#2568]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_invalid_mode@zero-clock.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-lnl:          [SKIP][214] ([Intel XE#9128]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-lnl:          [SKIP][216] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][217] +3 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:
    - shard-lnl:          [SKIP][218] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][219] +3 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-lnl:          [SKIP][220] ([Intel XE#7643]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_pm_lpsp@kms-lpsp.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][222] ([Intel XE#1489]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-lnl:          [SKIP][224] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr@psr2-no-drrs.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_psr@psr2-no-drrs.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][226] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [FAIL][228] ([Intel XE#9096]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-3/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [ABORT][230] ([Intel XE#8007]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-7/igt@xe_module_load@many-reload.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          [SKIP][232] ([Intel XE#1407]) -> [SKIP][233] ([Intel XE#9125]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][234] ([Intel XE#9125]) -> [SKIP][235] ([Intel XE#1407]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-lnl:          [SKIP][236] ([Intel XE#1124]) -> [SKIP][237] ([Intel XE#9125]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          [SKIP][238] ([Intel XE#9125]) -> [SKIP][239] ([Intel XE#1124]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][240] ([Intel XE#7679]) -> [SKIP][241] ([Intel XE#9125]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][242] ([Intel XE#9125]) -> [SKIP][243] ([Intel XE#8365])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][244] ([Intel XE#2887]) -> [SKIP][245] ([Intel XE#9125]) +7 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][246] ([Intel XE#2669] / [Intel XE#7389]) -> [SKIP][247] ([Intel XE#9125])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          [SKIP][248] ([Intel XE#3432]) -> [SKIP][249] ([Intel XE#9125])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][250] ([Intel XE#9125]) -> [SKIP][251] ([Intel XE#2887]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          [SKIP][252] ([Intel XE#9125]) -> [SKIP][253] ([Intel XE#4416] / [Intel XE#7381])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cdclk@plane-scaling.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-lnl:          [SKIP][254] ([Intel XE#9125]) -> [SKIP][255] ([Intel XE#7642])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          [SKIP][256] ([Intel XE#307] / [Intel XE#6974]) -> [SKIP][257] ([Intel XE#9125])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-1.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][258] ([Intel XE#9125]) -> [SKIP][259] ([Intel XE#1468] / [Intel XE#7396])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_content_protection@mei-interface.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          [SKIP][260] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][261] ([Intel XE#9125]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          [SKIP][262] ([Intel XE#9125]) -> [SKIP][263] ([Intel XE#1424]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cursor_crc@cursor-random-256x85.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-lnl:          [SKIP][264] ([Intel XE#9125]) -> [SKIP][265] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][266] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][267] ([Intel XE#9125]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][268] ([Intel XE#323] / [Intel XE#6035]) -> [SKIP][269] ([Intel XE#9125])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          [SKIP][270] ([Intel XE#1508]) -> [SKIP][271] ([Intel XE#9125])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-lnl:          [SKIP][272] ([Intel XE#8265]) -> [SKIP][273] ([Intel XE#9125]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-lnl:          [SKIP][274] ([Intel XE#9125]) -> [SKIP][275] ([Intel XE#8265])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][276] ([Intel XE#301] / [Intel XE#3149]) -> [SKIP][277] ([Intel XE#2482])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          [SKIP][278] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][279] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][280] ([Intel XE#6312]) -> [SKIP][281] ([Intel XE#7779]) +7 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][282] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][283] ([Intel XE#7779]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][284] ([Intel XE#7905]) -> [SKIP][285] ([Intel XE#7779]) +23 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][286] ([Intel XE#7779]) -> [SKIP][287] ([Intel XE#7061])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][288] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][289] ([Intel XE#2548] / [Intel XE#7779]) +21 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][290] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][291] ([Intel XE#2548] / [Intel XE#7779]) +9 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-lnl:          [SKIP][292] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][293] ([Intel XE#6312] / [Intel XE#651]) +4 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          [SKIP][294] ([Intel XE#7779]) -> [SKIP][295] ([Intel XE#6312]) +6 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-fullscreen.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][296] ([Intel XE#7779]) -> [SKIP][297] ([Intel XE#7905]) +17 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-lnl:          [SKIP][298] ([Intel XE#7399]) -> [SKIP][299] ([Intel XE#7779])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][300] ([Intel XE#7779]) -> [SKIP][301] ([Intel XE#7061] / [Intel XE#7356])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][302] ([Intel XE#7865]) -> [SKIP][303] ([Intel XE#7779]) +8 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          [SKIP][304] ([Intel XE#7779]) -> [SKIP][305] ([Intel XE#7865]) +10 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][306] ([Intel XE#7061]) -> [SKIP][307] ([Intel XE#7779]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][308] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][309] ([Intel XE#656] / [Intel XE#7905]) +15 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][310] ([Intel XE#3544]) -> [SKIP][311] ([Intel XE#3374] / [Intel XE#3544])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          [SKIP][312] ([Intel XE#1503]) -> [SKIP][313] ([Intel XE#9125])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_hdr@static-toggle.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          [SKIP][314] ([Intel XE#9125]) -> [SKIP][315] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:
    - shard-lnl:          [SKIP][316] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][317] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [SKIP][318] ([Intel XE#7778]) -> [FAIL][319] ([Intel XE#2029] / [Intel XE#7395])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          [SKIP][320] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][321] ([Intel XE#1489])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][322] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][323] ([Intel XE#1489])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][324] ([Intel XE#1489]) -> [SKIP][325] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-lnl:          [SKIP][326] ([Intel XE#1406]) -> [SKIP][327] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr@fbc-pr-primary-blt.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          [SKIP][328] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][329] ([Intel XE#1406] / [Intel XE#7345])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-lnl:          [SKIP][330] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][331] ([Intel XE#2850] / [Intel XE#929])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-page-flip.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-lnl:          [SKIP][332] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][333] ([Intel XE#1406])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr@pr-sprite-plane-onoff.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][334] ([Intel XE#1127] / [Intel XE#5813]) -> [SKIP][335] ([Intel XE#9125])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          [SKIP][336] ([Intel XE#9125]) -> [SKIP][337] ([Intel XE#362] / [Intel XE#5848])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][338] ([Intel XE#1499]) -> [SKIP][339] ([Intel XE#9125])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-vrr.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [ABORT][340] ([Intel XE#9131] / [Intel XE#9145]) -> [DMESG-WARN][341] ([Intel XE#9130])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_exec_reset@gt-reset-fault-injection.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [ABORT][342] ([Intel XE#8591] / [Intel XE#8963]) -> [DMESG-WARN][343] ([Intel XE#8963])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/igt@xe_wedged@basic-wedged.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
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
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7324
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7381]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7381
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7471
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7643
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7778]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7778
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095 -> xe-pw-169110v3

  IGT_9085: 9085
  xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095: 303ba83101bce8edfa88f91dc82d2697f596c095
  xe-pw-169110v3: 169110v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/index.html

--===============7341062803071903048==
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
<tr><td><b>Series:</b></td><td>Add support for a DRM backlight capability (=
rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/169110/">https://patchwork.freedesktop.org/series/169110/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169110v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169110v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5701-303ba83101bce8edfa88f91dc82d2697f=
596c095_FULL -&gt; xe-pw-169110v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169110v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-169110v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1691=
10v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_backlight@brightness-with-dpms:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-3/igt@kms_pm_b=
acklight@brightness-with-dpms.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_pm_backligh=
t@brightness-with-dpms.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169110v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-10/igt@core_ho=
tunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-1/igt@core_hotunplug@ho=
trebind-lateclose.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@fbdev@eof.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#=
2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@fbdev@un=
aligned-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@fbdev@unaligned-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">I=
ntel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_big_=
fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_big_fb@x-tile=
d-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_bw@linear-tiling-2-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_bw@linear-tiling-4-displa=
ys-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-til=
ed-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_cdclk@plane-scaling@pipe-=
b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4416">Intel XE#4416</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7381">Intel XE#7381</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_chamelium_color@ctm-0-75.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_chamelium_color@ctm-max.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc=
-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_colo=
r_pipeline@plane-lut1d-post-ctm3x4.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_color_=
pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_color_pipeline@plane-lut1=
d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_content_protection@dp-mst=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_content_protection@srm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_content_protection@suspen=
d-resume@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-=
flipa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-bigjoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127">I=
ntel XE#9127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fbco=
n_fbt@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9127">Intel XE#9127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">I=
ntel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_flip=
@flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_flip@flip-=
vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2482">Intel XE#2482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">In=
tel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#73=
51</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9144">Intel XE#9144</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-p016=
-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
hdr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +21 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +16=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
srhdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +33 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcp=
srhdr-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7779">Intel XE#7779</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@pipe=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +18 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shar=
d-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-w=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7779">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6=
/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">In=
tel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7779">Intel XE#7779</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-=
abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +12 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_frontbuffer_tracking@psrh=
dr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_inva=
lid_mode@overflow-vrefresh.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_invalid_mode@o=
verflow-vrefresh.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_plane@pixel-format-4-tile=
d-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7250">Intel XE#7250</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_plane@pixel-format-y-tile=
d-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_plane@pixel-format-y-tile=
d-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_plane@plane-position-hole=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7377">Intel XE#7377</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_plane_scaling@plane-downs=
cale-factor-0-75-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">In=
tel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_plane_scaling@plane-downs=
cale-factor-0-75-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#=
6886</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/s=
hard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-=
formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">=
Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_pm_r=
pm@modeset-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_prop=
erties@plane-properties-legacy.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_properties=
@plane-properties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9129">Intel XE#9129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr2=
_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/=
igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Inte=
l XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr@=
fbc-psr-primary-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr@fbc-psr-primary-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@kms_psr@fbc-psr2-basic@edp-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_psr@fbc-psr2-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7345">Intel XE#7345</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@kms_psr@psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr@psr2-sprite-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">=
Intel XE#9125</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_compute@ccs-mode-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7471">Intel XE#7471</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@xe_compute@ccs-mode-compute-k=
ernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_cw_post_sync@walker-post-s=
ync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_evict@evict-beng-cm-thread=
s-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_exec_balancer@many-cm-virt=
ual-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +14 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_exec_fault_mode@twice-mult=
i-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +21 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +16 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_exec_reset@multi-queue-cat=
-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_exec_reset@multi-queue-gt-=
reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-wt-single-vma.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_mmap@pci-membarrier-bad-pa=
gesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7322">Intel XE#7322</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-9/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095=
/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f59=
6c095/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d269=
7f596c095/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82=
d2697f596c095/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f=
91dc82d2697f596c095/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edf=
a88f91dc82d2697f596c095/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce=
8edfa88f91dc82d2697f596c095/shard-bmg-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba8310=
1bce8edfa88f91dc82d2697f596c095/shard-bmg-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba=
83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-3=
03ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-57=
01-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/s=
hard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c0=
95/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard=
-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169110v3/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-5/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_module_load@load.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard=
-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-10/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169110v3/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-169110v3/shard-bmg-5/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169110v3/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-169110v3/shard-bmg-9/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/sha=
rd-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-8/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169110v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-9/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-7/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169110v3/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_multigpu_svm@mgpu-latency-=
copy-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_noexec_ping_pong@basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6259">Intel XE#6259</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7324">Intel XE#7324</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7406">Intel XE#7406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@xe_page_reclaim@basic-mixed.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_page_reclaim@prl-invalidat=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_pm@s3-vm-bind-prefetch.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_pm_residency@aspm_link_res=
idency.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7271">Intel XE#7271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_prefetch_fault@prefetch-fa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_query@multigpu-query-engin=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-bmg-3/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@bulk-preempt-timeout-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-1/igt@xe_sriov_admin@bulk-preempt-t=
imeout-vfs-disabled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-low-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@xe_sriov_scheduling@equal-thr=
oughput-low-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169110v3/shard-lnl-7/igt@xe_vm@overcommit-nonfault-vra=
m-lr-external-nodefer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_colo=
r@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_color@ctm=
-blue-to-red.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_curs=
or_edge_walk@64x64-top-edge.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms=
_cursor_edge_walk@64x64-top-edge.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_flip=
@dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/=
igt@kms_flip@dpms-vs-vblank-race-interruptible.html">PASS</a> +3 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#777=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-d=
raw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7=
779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
69110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.ht=
ml">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_inva=
lid_mode@zero-clock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_invalid=
_mode@zero-clock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plan=
e@plane-panning-bottom-right.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@km=
s_plane@plane-panning-bottom-right.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886=
">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_plane_s=
caling@plane-downscale-factor-0-75-with-modifiers.html">PASS</a> +3 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel=
 XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_plane_scaling@plane-downscal=
e-factor-0-75-with-modifiers@pipe-a.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7643">Intel XE#7643</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_pm_lpsp@kms-lp=
sp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr2=
_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard=
-lnl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr@=
psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_ps=
r@psr2-no-drrs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169110v3/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-5/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3=
/shard-lnl-3/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-7/igt@xe_modul=
e_load@many-reload.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-2/igt@xe_module_l=
oad@many-reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_big_=
fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms=
_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3=
/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_big_=
fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms=
_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#91=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9110v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1691=
10v3/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1691=
10v3/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_ccs@=
bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-ln=
l-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_ccs@=
bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/s=
hard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard=
-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Inte=
l XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shar=
d-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">In=
tel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7381">Intel XE#7381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cont=
ent_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/i=
gt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/sh=
ard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@km=
s_content_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396">Intel XE#7396</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_curs=
or_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/sh=
ard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#912=
5</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_curs=
or_crc@cursor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms=
_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel =
XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel X=
E#309</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7343">Intel XE#7343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-=
atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/323">Intel XE#323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6035">Intel XE#6035</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_cursor_legacy@shor=
t-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel X=
E#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_dsc@=
dsc-with-bpc-formats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/ig=
t@kms_dsc@dsc-with-bpc-formats-bigjoiner.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_dsc@=
dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/i=
gt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1691=
10v3/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482=
">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel X=
E#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9144">Intel XE#9144</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel=
 XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#63=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb=
-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7779">Intel XE#7779</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Inte=
l XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7779">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel=
 XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/s=
hard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
61">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">I=
ntel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7779">Intel XE#7779</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel =
XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledpr=
imary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-fullscreen=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Inte=
l XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primsc=
rn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">In=
tel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scnd=
scrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +17 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/ig=
t@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3=
/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#=
7865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169110v3/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7779">Intel XE#7779</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1691=
10v3/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7865">Intel XE#7865</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/sh=
ard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779=
">Intel XE#7779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2=
548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
79">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scnds=
crn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +15 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-9/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-6/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_hdr@static-to=
ggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/ig=
t@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6=
912</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
75">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-c.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_plane_scaling@planes-downscal=
e-factor-0-5-upscale-20x20@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Int=
el XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7778">Intel XE#7778</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@kms_pm_dc@deep-pkgc=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2029">Intel XE#2029</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304"=
>Intel XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Inte=
l XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169110v3/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-=
exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-l=
nl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE=
#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr@=
fbc-pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_psr@fbc-=
pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr@=
fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-l=
nl-5/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel =
XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr@=
fbc-psr2-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-=
lnl-6/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel X=
E#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr@=
pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/i=
gt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1691=
10v3/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125"=
>Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-5/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-lnl-6/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_exec_=
reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9131">Intel XE#9131</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/s=
hard-bmg-3/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel=
 XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/igt@xe_wedge=
d@basic-wedged.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8591">Intel XE#8591</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169110v3/shard-bmg-4/igt@x=
e_wedged@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095 -&gt; xe-pw-169=
110v3</li>
</ul>
<p>IGT_9085: 9085<br />
  xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095: 303ba83101bce8edfa88f91=
dc82d2697f596c095<br />
  xe-pw-169110v3: 169110v3</p>

</body>
</html>

--===============7341062803071903048==--
