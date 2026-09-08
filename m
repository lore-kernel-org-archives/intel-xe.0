Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54911C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 04:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1464310E983;
	Tue,  8 Sep 2026 04:22:58 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FB810E043;
 Tue,  8 Sep 2026 04:22:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0474329267707616836=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/mmio=3A_Fix_xe=5Fmm?=
 =?utf-8?q?io=5Fwait32=28=29_to_honor_delay/sleep_maximums?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 04:22:57 -0000
Message-ID: <178884137746.130176.2437334473925639487@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907235524.7807-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260907235524.7807-2-alan.previn.teres.alexis@intel.com>
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

--===============0474329267707616836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums
URL   : https://patchwork.freedesktop.org/series/173538/
State : failure

== Summary ==

CI Bug Log - changes from xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095_FULL -> xe-pw-173538v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-173538v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-173538v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-173538v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:
    - shard-bmg:          [PASS][1] -> [TIMEOUT][2] +1 other test timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html

  
Known issues
------------

  Here are the changes found in xe-pw-173538v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@fbdev@write.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1407]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#7059] / [Intel XE#7085])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][6] -> [SKIP][7] ([Intel XE#9125]) +16 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +9 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1428] / [Intel XE#7387])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#9125]) +20 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#8365]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7679])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +13 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#3432])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3432]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#4417] / [Intel XE#5447]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#4416] / [Intel XE#7381]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_cdclk@plane-scaling@pipe-b-edp-1.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2325] / [Intel XE#7358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7358])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373]) +8 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-lnl:          [PASS][26] -> [SKIP][27] ([Intel XE#7006]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#6974])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#6974]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#307] / [Intel XE#6974])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7642]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2320]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1424]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#309] / [Intel XE#7343]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#323] / [Intel XE#6035])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#4354] / [Intel XE#5870])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#9009])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#8265])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#8265]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#8680])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_fbcon_fbt@psr.html
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#8680])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2372] / [Intel XE#7359])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#701] / [Intel XE#7359])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#703] / [Intel XE#7448])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dsc:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#8586])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1421]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-lnl:          [PASS][48] -> [SKIP][49] ([Intel XE#2482])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_flip@flip-vs-panning-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2482])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7178] / [Intel XE#7351])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-lnl:          [PASS][55] -> [SKIP][56] ([Intel XE#1745] / [Intel XE#9144])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#352]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2311]) +21 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4141]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          [PASS][60] -> [SKIP][61] ([Intel XE#7779])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7061] / [Intel XE#7356]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#6312]) +11 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7061] / [Intel XE#7356])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#6312] / [Intel XE#651]) +7 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#7399])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#7865]) +26 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2548] / [Intel XE#7779]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2313]) +23 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7061]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7779]) +15 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          [PASS][72] -> [SKIP][73] ([Intel XE#2548] / [Intel XE#7779]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#656] / [Intel XE#7905]) +40 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#7905]) +43 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#7061]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#3374] / [Intel XE#3544])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-lnl:          [PASS][78] -> [SKIP][79] ([Intel XE#2568]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_invalid_mode@uint-max-clock.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#6911] / [Intel XE#7466])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#8348])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#7591])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#7283]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#8303]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#7283]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#4596] / [Intel XE#5854]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#5021] / [Intel XE#7377])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#5020] / [Intel XE#7348])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-lnl:          [PASS][91] -> [SKIP][92] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#8396]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1489]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#4608]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1489]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          [PASS][106] -> [SKIP][107] ([Intel XE#1489])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1128] / [Intel XE#7413])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1406] / [Intel XE#7345]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@fbc-psr2-suspend@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_psr@fbc-psr2-suspend@edp-1.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2850] / [Intel XE#929])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1406]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-no-drrs:
    - shard-lnl:          [PASS][114] -> [SKIP][115] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_psr@psr-no-drrs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#7795])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1127] / [Intel XE#5813])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2330] / [Intel XE#5813])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [PASS][120] -> [SKIP][121] ([Intel XE#1435] / [Intel XE#9142])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_setmode@basic.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1435] / [Intel XE#9142])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1499])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#1499])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_ccs@vm-bind-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#7644])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_ccs@vm-bind-decompress.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#6599])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#6540] / [Intel XE#688]) +12 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_exec_balancer@once-virtual-basic:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#7482]) +19 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_exec_balancer@once-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1392]) +8 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#8374]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#8374]) +17 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#8364]) +31 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#8364]) +9 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#8369]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_exec_reset@multi-queue-cat-error.html
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#8369]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#6196])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#8378]) +10 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#8378]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_madvise@atomic-cpu:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#7980]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_madvise@atomic-cpu.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_mmap@pci-membarrier.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155]) -> ([PASS][156], [PASS][157], [SKIP][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171]) ([Intel XE#378] / [Intel XE#7405])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-3/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-5/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-5/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-3/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196]) -> ([PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [SKIP][220], [PASS][221], [PASS][222]) ([Intel XE#2457] / [Intel XE#7405])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-3/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-9/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-2/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-1/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-3/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-10/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-9/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-7/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-7/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-1/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-6/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-2/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-10/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-4/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-5/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-10/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-4/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-6/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-3/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-3/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-6/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-6/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-7/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-6/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-4/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-4/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-4/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-5/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-5/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-8/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-8/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-7/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-1/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-1/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-2/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-2/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-1/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-lnl:          NOTRUN -> [SKIP][223] ([Intel XE#6964]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_noexec_ping_pong@basic:
    - shard-lnl:          NOTRUN -> [SKIP][224] ([Intel XE#6259] / [Intel XE#7324] / [Intel XE#7406])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_noexec_ping_pong@basic.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][225] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#7793]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_page_reclaim@random:
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#7793]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_page_reclaim@random.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][228] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][229] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_pm@d3cold-mmap-system.html
    - shard-bmg:          NOTRUN -> [SKIP][230] ([Intel XE#2284] / [Intel XE#7370])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][231] ([Intel XE#2284] / [Intel XE#7370])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][232] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#584] / [Intel XE#7369]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-lnl:          NOTRUN -> [SKIP][234] ([Intel XE#4650] / [Intel XE#7347])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][235] ([Intel XE#944]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][236] ([Intel XE#944]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#7174]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][238] ([Intel XE#4130] / [Intel XE#7366])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-lnl:          NOTRUN -> [SKIP][239] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_sriov_vram@vf-access-provisioned.html

  * igt@xe_vm@out-of-memory:
    - shard-lnl:          NOTRUN -> [SKIP][240] ([Intel XE#5745] / [Intel XE#7892])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_vm@out-of-memory.html

  * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
    - shard-lnl:          NOTRUN -> [SKIP][241] ([Intel XE#7892]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][242] ([Intel XE#8963])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-lnl:          [SKIP][243] ([Intel XE#9125]) -> [PASS][244] +11 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-lnl:          [SKIP][245] ([Intel XE#2482]) -> [PASS][246] +2 other tests pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-lnl:          [SKIP][247] ([Intel XE#1745] / [Intel XE#9144]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-lnl:          [SKIP][249] ([Intel XE#2682]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][251] ([Intel XE#7779]) -> [PASS][252] +1 other test pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][253] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][254] +6 other tests pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][255] ([Intel XE#1503]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-lnl:          [SKIP][257] ([Intel XE#2568]) -> [PASS][258]
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_invalid_mode@zero-clock.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-lnl:          [SKIP][259] ([Intel XE#7250] / [Intel XE#9128]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-lnl:          [SKIP][261] ([Intel XE#9128]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-lnl:          [SKIP][263] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][264] +1 other test pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:
    - shard-lnl:          [SKIP][265] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html

  * igt@kms_psr@psr2-primary-render:
    - shard-lnl:          [SKIP][267] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][268] +1 other test pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr@psr2-primary-render.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_psr@psr2-primary-render.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][269] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [FAIL][271] ([Intel XE#9096]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [ABORT][273] ([Intel XE#8007]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-7/igt@xe_module_load@many-reload.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          [SKIP][275] ([Intel XE#1407]) -> [SKIP][276] ([Intel XE#9125]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][277] ([Intel XE#9125]) -> [SKIP][278] ([Intel XE#1407])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][279] ([Intel XE#9125]) -> [SKIP][280] ([Intel XE#1477] / [Intel XE#7361]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-lnl:          [SKIP][281] ([Intel XE#1124]) -> [SKIP][282] ([Intel XE#9125]) +3 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-lnl:          [SKIP][283] ([Intel XE#9125]) -> [SKIP][284] ([Intel XE#1124])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][285] ([Intel XE#7679]) -> [SKIP][286] ([Intel XE#9125])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][287] ([Intel XE#2887]) -> [SKIP][288] ([Intel XE#9125]) +4 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          [SKIP][289] ([Intel XE#9125]) -> [SKIP][290] ([Intel XE#2887]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          [SKIP][291] ([Intel XE#3432]) -> [SKIP][292] ([Intel XE#9125])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          [SKIP][293] ([Intel XE#9125]) -> [SKIP][294] ([Intel XE#4416] / [Intel XE#7381])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cdclk@plane-scaling.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          [SKIP][295] ([Intel XE#307] / [Intel XE#6974]) -> [SKIP][296] ([Intel XE#9125])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-1.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-lnl:          [SKIP][297] ([Intel XE#9125]) -> [SKIP][298] ([Intel XE#7642])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_content_protection@lic-type-0-hdcp14.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          [SKIP][299] ([Intel XE#9125]) -> [SKIP][300] ([Intel XE#1424]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cursor_crc@cursor-random-256x85.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          [SKIP][301] ([Intel XE#1424]) -> [SKIP][302] ([Intel XE#9125]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          [SKIP][303] ([Intel XE#9125]) -> [SKIP][304] ([Intel XE#309] / [Intel XE#7343])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][305] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][306] ([Intel XE#9125]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          [SKIP][307] ([Intel XE#1508]) -> [SKIP][308] ([Intel XE#9125])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-lnl:          [SKIP][309] ([Intel XE#8265]) -> [SKIP][310] ([Intel XE#9125])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          [SKIP][311] ([Intel XE#9125]) -> [SKIP][312] ([Intel XE#8265])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-formats.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][313] ([Intel XE#301] / [Intel XE#3149]) -> [SKIP][314] ([Intel XE#2482])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][315] ([Intel XE#6312]) -> [SKIP][316] ([Intel XE#7779]) +6 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][317] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][318] ([Intel XE#7779]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][319] ([Intel XE#7779]) -> [SKIP][320] ([Intel XE#7061])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][321] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][322] ([Intel XE#656] / [Intel XE#7905]) +8 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-lnl:          [SKIP][323] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][324] ([Intel XE#2548] / [Intel XE#7779]) +13 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][325] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][326] ([Intel XE#2548] / [Intel XE#7779]) +5 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-lnl:          [SKIP][327] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][328] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          [SKIP][329] ([Intel XE#7779]) -> [SKIP][330] ([Intel XE#6312])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-fullscreen.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [SKIP][331] ([Intel XE#7865]) -> [SKIP][332] ([Intel XE#7779]) +3 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          [SKIP][333] ([Intel XE#7779]) -> [SKIP][334] ([Intel XE#7865]) +4 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move:
    - shard-lnl:          [SKIP][335] ([Intel XE#7779]) -> [SKIP][336] ([Intel XE#7905]) +12 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-lnl:          [SKIP][337] ([Intel XE#7399]) -> [SKIP][338] ([Intel XE#7779])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][339] ([Intel XE#7779]) -> [SKIP][340] ([Intel XE#7061] / [Intel XE#7356])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][341] ([Intel XE#7061]) -> [SKIP][342] ([Intel XE#7779]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][343] ([Intel XE#7905]) -> [SKIP][344] ([Intel XE#7779]) +17 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          [SKIP][345] ([Intel XE#1503]) -> [SKIP][346] ([Intel XE#9125])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_hdr@static-toggle.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          [SKIP][347] ([Intel XE#9125]) -> [SKIP][348] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [SKIP][349] ([Intel XE#7778]) -> [FAIL][350] ([Intel XE#2029] / [Intel XE#7395])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          [SKIP][351] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][352] ([Intel XE#1489])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][353] ([Intel XE#1489]) -> [SKIP][354] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          [SKIP][355] ([Intel XE#1128] / [Intel XE#7413]) -> [SKIP][356] ([Intel XE#1122] / [Intel XE#7429])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          [SKIP][357] ([Intel XE#1122] / [Intel XE#7429]) -> [SKIP][358] ([Intel XE#1128] / [Intel XE#7413])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr2_su@page_flip-p010.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-lnl:          [SKIP][359] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][360] ([Intel XE#1406])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr@fbc-pr-primary-page-flip.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          [SKIP][361] ([Intel XE#1406]) -> [SKIP][362] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][363] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][364] ([Intel XE#9125])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][365] ([Intel XE#1127] / [Intel XE#5813]) -> [SKIP][366] ([Intel XE#9125])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-lnl:          [SKIP][367] ([Intel XE#9125]) -> [SKIP][368] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][369] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][370] ([Intel XE#2426] / [Intel XE#5848])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][371] ([Intel XE#1499]) -> [SKIP][372] ([Intel XE#9125])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-vrr.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [ABORT][373] ([Intel XE#9131] / [Intel XE#9145]) -> [DMESG-WARN][374] ([Intel XE#9130])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-8/igt@xe_exec_reset@gt-reset-fault-injection.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_exec_reset@gt-reset-fault-injection.html
    - shard-lnl:          [ABORT][375] ([Intel XE#9140] / [Intel XE#9145]) -> [DMESG-WARN][376] ([Intel XE#9130])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@xe_exec_reset@gt-reset-fault-injection.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_exec_reset@gt-reset-fault-injection.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
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
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7324
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7347]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7347
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7381]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7381
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
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
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131
  [Intel XE#9140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095 -> xe-pw-173538v1

  IGT_9085: 9085
  xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095: 303ba83101bce8edfa88f91dc82d2697f596c095
  xe-pw-173538v1: 173538v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/index.html

--===============0474329267707616836==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmio: Fix xe_mmio_wait32() to honor d=
elay/sleep maximums</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/173538/">https://patchwork.freedesktop.org/series/173538/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-173538v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173538v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5701-303ba83101bce8edfa88f91dc82d2697f=
596c095_FULL -&gt; xe-pw-173538v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-173538v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-173538v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1735=
38v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs=
-random-gt0-rcs0:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-4/igt@xe_sriov=
_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-173538v1/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets=
-normal-priority@numvfs-random-gt0-rcs0.html">TIMEOUT</a> +1 other test tim=
eout</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173538v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@fbdev@write.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel X=
E#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stri=
de-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_big_=
fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_big_fb@x-tile=
d-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1428">Intel XE#1428</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9125">Intel XE#9125</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_bw@connected-linear-tili=
ng-4-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displa=
ys-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_ccs@bad-rotation-90-y-til=
ed-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_cdclk@mode-transition@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5447">Intel XE#5447</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_cdclk@plane-scaling@pipe-=
b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4416">Intel XE#4416</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7381">Intel XE#7381</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_chamelium_color@ctm-max.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_chamelium_color_pipeline@=
plane-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_chamelium_frames@dp-crc-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_chamelium_frames@hdmi-crc=
-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_colo=
r_pipeline@plane-lut1d-post-ctm3x4.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_color_=
pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_content_protection@dp-mst=
-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_content_protection@dp-ms=
t-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_content_protection@uevent=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_cursor_crc@cursor-offscr=
een-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding=
-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1424">Intel XE#1424</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@uhb=
r-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_dsc@dsc-with-bpc-bigjoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">I=
ntel XE#8680</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">I=
ntel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/701">Intel XE#701</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/703">Intel XE#703</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_feature_discovery@dsc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_flip=
@flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_flip@flip-=
vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_flip@plain-flip-ts-check.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2482">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385"=
>Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9144">Intel XE#9144</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE=
#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7385">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9144">Intel XE#9144</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-l=
nl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drr=
s-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard=
-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +11 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbch=
dr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +26 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
psrhdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +23 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcp=
srhdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +15 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6=
/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">In=
tel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7779">Intel XE#7779</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +40=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psrh=
dr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +43 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psrh=
dr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_inva=
lid_mode@uint-max-clock.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_invalid_mode@uint=
-max-clock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2568">Intel XE#2568</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_joiner@invalid-modeset-f=
orce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_mst@mst-suspend-read-crc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_plane@pixel-format-4-tile=
d-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_plane@pixel-format-x-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_plane@pixel-format-y-til=
ed-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-=
none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5854">Intel XE#5854</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_plane_scaling@plane-scale=
r-unity-scaling-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel =
XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_plane_scaling@plane-scale=
r-unity-scaling-with-modifiers@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/s=
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
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2938">Intel XE#2938</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulatio=
n@psr2-yuv420.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_pm_rpm@dpms-mode-unset-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-e=
dp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7=
304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#73=
04</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_psr2=
_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/=
igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Inte=
l XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_psr@fbc-psr2-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7345">Intel XE#7345</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_psr@fbc-psr2-suspend@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_psr@pr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_psr@pr-sprite-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_psr@psr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_psr@=
psr-no-drrs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_psr@psr-no-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Int=
el XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_setm=
ode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_setmode@basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel X=
E#1435</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_setmode@invalid-clone-sin=
gle-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@kms_vrr@negative-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-d=
rrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_ccs@vm-bind-decompress.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_compute@ccs-mode-compute-=
kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_create@create-big-vram.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1062">Intel XE#1062</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7318">Intel XE#7318</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_evict@evict-beng-cm-thread=
s-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_exec_balancer@once-virtual=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7482">Intel XE#7482</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +31 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_exec_reset@multi-queue-cat=
-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat=
-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-wt-multi-vma.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-cpu:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_madvise@atomic-cpu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/798=
0">Intel XE#7980</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_mmap@pci-membarrier.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
00">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7322">Intel XE#7322</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-l=
nl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/sha=
rd-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697f596=
c095/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d2697=
f596c095/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91dc82d=
2697f596c095/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88f91d=
c82d2697f596c095/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8edfa88=
f91dc82d2697f596c095/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5701-303ba83101bce8ed=
fa88f91dc82d2697f596c095/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v=
1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-173538v1/shard-lnl-6/igt@xe_module_load@load.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v=
1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-173538v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v=
1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-173538v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v=
1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>)</li>
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
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-173538v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173538v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-173538v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shar=
d-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-173538v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-173538v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shar=
d-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173538v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-173538v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173538v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/sha=
rd-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_module_load@lo=
ad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173538v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_multigpu_svm@mgpu-migratio=
n-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_noexec_ping_pong@basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6259">Intel XE#6259</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7324">Intel XE#7324</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7406">Intel XE#7406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7325">Intel XE#7325</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_page_reclaim@invalid-1g.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_page_reclaim@random.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
93">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_pm@d3hot-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Int=
el XE#5742</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7328">Intel XE#7328</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@xe_pm@s3-d3hot-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7369">Intel XE#7369</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_pmu@fn-engine-activity-sch=
ed-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4650">Intel XE#4650</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7347">Intel XE#7347</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-bmg-9/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_sriov_admin@bulk-exec-quan=
tum-vfs-disabled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7174">Intel XE#7174</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_sriov_vram@vf-access-provi=
sioned.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6376">Intel XE#6376</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-3/igt@xe_vm@out-of-memory.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745"=
>Intel XE#5745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-7/igt@xe_vm@overcommit-fault-vram-l=
r-no-overcommit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7892">Intel XE#7892</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173538v1/shard-lnl-5/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_big_=
fb@linear-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_bi=
g_fb@linear-32bpp-rotate-0.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_flip=
@flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@km=
s_flip@flip-vs-dpms-off-vs-modeset.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/914=
4">Intel XE#9144</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-t=
o-64bpp-4tile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_flip=
_tiling@flip-change-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2682">Intel XE#2682</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_=
flip_tiling@flip-change-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#777=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173=
538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-d=
raw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn=
-indfb-msflip-blt.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-4/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-7/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_inva=
lid_mode@zero-clock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_invalid=
_mode@zero-clock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plan=
e@pixel-format-4-tiled-lnl-ccs-modifier.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#91=
28</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
3538v1/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plan=
e@plane-panning-bottom-right.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@km=
s_plane@plane-panning-bottom-right.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale=
-factor-0-75-with-rotation@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_p=
lane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr@=
psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/ig=
t@kms_psr@psr2-primary-render.html">PASS</a> +1 other test pass</li>
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
-173538v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html=
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
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1=
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
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-bmg-10/igt@xe_module_=
load@many-reload.html">PASS</a></li>
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
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms=
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
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1=
/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl=
-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#147=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361=
">Intel XE#7361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_big_=
fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms=
_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-=
lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel =
XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1735=
38v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_ccs@=
bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-ln=
l-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_ccs@=
bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@k=
ms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard=
-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Inte=
l XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7381">Intel XE#7381</a>)</li>
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/sh=
ard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_cont=
ent_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/ig=
t@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_curs=
or_crc@cursor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms=
_cursor_crc@cursor-random-256x85.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_curs=
or_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms=
_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
73538v1/shard-lnl-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
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
intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-=
atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-l=
nl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE=
#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_dsc@ds=
c-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
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
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1735=
38v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482=
">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#63=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
3538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb=
-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7779">Intel XE#7779</a>) +6 other tests skip</li>
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
e-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7779">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/s=
hard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
61">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#=
2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-prim=
scrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905"=
>Intel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scnd=
scrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +13 other =
tests skip</li>
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
173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7779">Intel XE#7779</a>) +5 other tests skip</li>
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
pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledpr=
imary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
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
e-pw-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primsc=
rn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1735=
38v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7779">Intel XE#7779</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE=
#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173538v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-i=
ndfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1735=
38v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7905">Intel XE#7905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/ig=
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
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1=
/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/sh=
ard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779=
">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel =
XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173538v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_hdr@static-to=
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/ig=
t@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6=
912</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
75">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7778">Intel XE#7778</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/igt@kms_pm_dc@deep-pkgc=
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
-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-l=
nl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE=
#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-ln=
l-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7=
429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-1/ig=
t@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_psr@=
fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-=
1/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_psr@=
fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_p=
sr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@kms_rota=
tion_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342"=
>Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect=
-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>)</li>
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
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1735=
38v1/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125"=
>Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-6/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-ln=
l-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3=
414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/39=
04">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shar=
d-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-1/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/shard-lnl-6/igt@kms_vrr@=
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
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/s=
hard-bmg-9/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel=
 XE#9130</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095/shard-lnl-7/igt@xe_exec_=
reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9140">Intel XE#9140</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173538v1/s=
hard-lnl-6/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel=
 XE#9130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095 -&gt; xe-pw-173=
538v1</li>
</ul>
<p>IGT_9085: 9085<br />
  xe-5701-303ba83101bce8edfa88f91dc82d2697f596c095: 303ba83101bce8edfa88f91=
dc82d2697f596c095<br />
  xe-pw-173538v1: 173538v1</p>

</body>
</html>

--===============0474329267707616836==--
