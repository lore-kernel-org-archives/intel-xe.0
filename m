Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF7AC54FD2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 03:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2A810E07B;
	Thu, 30 Jul 2026 03:25:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515FA10E07B;
 Thu, 30 Jul 2026 03:25:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4045827973265297272=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Use_IBC_v3_on_PT?=
 =?utf-8?q?L_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jul 2026 03:25:07 -0000
Message-ID: <178538190729.3374.7566637023012341889@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260729221629.593195-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260729221629.593195-1-vinay.belgaumkar@intel.com>
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

--===============4045827973265297272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use IBC v3 on PTL (rev7)
URL   : https://patchwork.freedesktop.org/series/169654/
State : failure

== Summary ==

CI Bug Log - changes from xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc_FULL -> xe-pw-169654v7_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169654v7_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169654v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169654v7_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +703 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_addfb_basic@unused-handle.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][3] +175 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_module_load@many-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][6] ([Intel XE#2327]) -> [SKIP][7] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][8] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][9] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][10] ([Intel XE#1124]) -> [SKIP][11] +12 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][12] ([Intel XE#7679]) -> [SKIP][13] +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][14] ([Intel XE#367]) -> [SKIP][15] +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][16] ([Intel XE#2887]) -> [SKIP][17] +13 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][18] ([Intel XE#7084] / [Intel XE#8150]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][20] ([Intel XE#3432]) -> [SKIP][21] +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][22] ([Intel XE#2652]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][24] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][26] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_chamelium_color@gamma.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          [SKIP][28] ([Intel XE#7358]) -> [SKIP][29] +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][30] ([Intel XE#2252]) -> [SKIP][31] +10 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][32] ([Intel XE#6974]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][34] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [FAIL][36] ([Intel XE#6707] / [Intel XE#7439]) -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][38] ([Intel XE#2320]) -> [SKIP][39] +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][40] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          [SKIP][42] ([Intel XE#8265]) -> [SKIP][43] +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][44] ([Intel XE#2374] / [Intel XE#6127]) -> [SKIP][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_feature_discovery@psr1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][46] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][48] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][50] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][51] +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][52] ([Intel XE#4141]) -> [SKIP][53] +15 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][54] ([Intel XE#2311]) -> [SKIP][55] +56 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][56] ([Intel XE#7061]) -> [SKIP][57] +11 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          [SKIP][58] ([Intel XE#7399]) -> [SKIP][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][60] ([Intel XE#2350] / [Intel XE#7503]) -> [SKIP][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][62] ([Intel XE#2313]) -> [SKIP][63] +60 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][64] ([Intel XE#7591]) -> [SKIP][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][66] ([Intel XE#7283]) -> [SKIP][67] +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][68] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][70] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          [SKIP][72] ([Intel XE#8395] / [Intel XE#8396]) -> [SKIP][73] +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_pm_dc@dc3co-after-dc6.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][74] ([Intel XE#3309] / [Intel XE#7368]) -> [SKIP][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][76] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][78] ([Intel XE#1489]) -> [SKIP][79] +9 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][80] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][82] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][83] +10 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][84] ([Intel XE#7795]) -> [SKIP][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][86] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][88] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][90] ([Intel XE#1435] / [Intel XE#8695]) -> [SKIP][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][92] ([Intel XE#6503]) -> [SKIP][93] +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_sharpness_filter@filter-basic.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][94] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][96] ([Intel XE#1499]) -> [SKIP][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_vrr@max-min.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_vrr@max-min.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][98] ([Intel XE#6599]) -> [SKIP][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][100] ([Intel XE#8370]) -> [SKIP][101] +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-cm.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-bmg:          [SKIP][102] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][103] +10 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-rebind.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          [SKIP][104] ([Intel XE#8374]) -> [SKIP][105] +16 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][106] ([Intel XE#8364]) -> [SKIP][107] +30 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][108] ([Intel XE#8369]) -> [SKIP][109] +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-bmg:          [SKIP][110] ([Intel XE#8378]) -> [SKIP][111] +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          [SKIP][112] ([Intel XE#7793]) -> [SKIP][113] +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_page_reclaim@invalid-1g.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          [FAIL][114] ([Intel XE#7695]) -> [SKIP][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_pat@pat-sw-hw-suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][116] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][117] +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_pm@d3cold-basic.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][118] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400]) -> [SKIP][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][120] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][121] +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][122] ([Intel XE#944]) -> [SKIP][123] +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [DMESG-WARN][124] ([Intel XE#5545]) -> [SKIP][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html

  
New tests
---------

  New tests have been introduced between xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc_FULL and xe-pw-169654v7_FULL:

### New IGT tests (8) ###

  * igt@kms_async_flips@async-flip-hang@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_async_flips@async-flip-hang@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.20] s

  * igt@kms_async_flips@async-flip-hang@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_async_flips@async-flip-hang@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_async_flips@async-flip-hang@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@async-flip-hang@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.19] s

  * igt@kms_async_flips@async-flip-hang@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_async_flips@async-flip-hang@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  

Known issues
------------

  Here are the changes found in xe-pw-169654v7_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2134])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@fbdev@write.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][127] -> [SKIP][128] ([Intel XE#5177])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][129] -> [FAIL][130] ([Intel XE#3718] / [Intel XE#6078])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [PASS][131] -> [FAIL][132] ([Intel XE#6078])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2327]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#607] / [Intel XE#7361])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2328] / [Intel XE#7367])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#1124]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#7679])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2887]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2652]) +15 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2325] / [Intel XE#7358])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#7358])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2252]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#6969]) +10 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#6974])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][146] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][147] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#4354] / [Intel XE#5870])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#8265]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#1138] / [Intel XE#7344])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][152] -> [FAIL][153] ([Intel XE#301])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#7061]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#4141]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2311]) +25 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#7399])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2352] / [Intel XE#7399])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2313]) +27 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#6901])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#8303]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#7283]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#8076])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#8396]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#1489]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2387] / [Intel XE#7429])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2330] / [Intel XE#5813])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#6503])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#6599])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#8374]) +7 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#8364]) +14 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#8369])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#8378]) +5 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][179] -> [ABORT][180] ([Intel XE#8007]) +1 other test abort
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-9/igt@xe_module_load@reload-no-display.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@xe_module_load@reload-no-display.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#6964])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#7793])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#7590])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance1:
    - shard-bmg:          [PASS][184] -> [FAIL][185] ([Intel XE#8555])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-1/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance1.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#944])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [FAIL][187] ([Intel XE#8711]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@core_getversion@all-cards.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [ABORT][189] ([Intel XE#8007]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [SKIP][191] ([Intel XE#2134]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@fbdev@unaligned-write.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@fbdev@unaligned-write.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][193] ([Intel XE#301]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][195] -> [PASS][196] +995 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][197] -> [SKIP][198] ([Intel XE#2327]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][199] -> [SKIP][200] ([Intel XE#7059] / [Intel XE#7085])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][201] -> [SKIP][202] ([Intel XE#1124]) +13 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][203] -> [SKIP][204] ([Intel XE#607] / [Intel XE#7361])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][205] -> [SKIP][206] ([Intel XE#7679]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][207] -> [SKIP][208] ([Intel XE#367]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][209] -> [SKIP][210] ([Intel XE#2652]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][211] -> [SKIP][212] ([Intel XE#3432]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][213] -> [SKIP][214] ([Intel XE#2887]) +22 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][215] -> [SKIP][216] ([Intel XE#2325] / [Intel XE#7358]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-bmg:          [SKIP][217] -> [SKIP][218] ([Intel XE#7358])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][219] -> [SKIP][220] ([Intel XE#2252]) +11 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][221] -> [SKIP][222] ([Intel XE#7642]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_content_protection@content-type-change.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][223] -> [SKIP][224] ([Intel XE#2390] / [Intel XE#6974])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][225] -> [FAIL][226] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_content_protection@legacy.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][227] -> [SKIP][228] ([Intel XE#2320]) +8 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][229] -> [SKIP][230] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][231] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][232] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][233] -> [SKIP][234] ([Intel XE#2286] / [Intel XE#6035])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][235] -> [SKIP][236] ([Intel XE#1508])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][237] -> [SKIP][238] ([Intel XE#4354] / [Intel XE#7386])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][239] -> [SKIP][240] ([Intel XE#4331] / [Intel XE#7227])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-bmg:          [SKIP][241] -> [SKIP][242] ([Intel XE#8265]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][243] -> [SKIP][244] ([Intel XE#4422] / [Intel XE#7442])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][245] -> [SKIP][246] ([Intel XE#8680])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_fbcon_fbt@psr.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][247] -> [SKIP][248] ([Intel XE#2372] / [Intel XE#7359])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dsc:
    - shard-bmg:          [SKIP][249] -> [SKIP][250] ([Intel XE#8586])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_feature_discovery@dsc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][251] -> [SKIP][252] ([Intel XE#7178] / [Intel XE#7349])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          [SKIP][253] -> [SKIP][254] ([Intel XE#7179])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][255] -> [SKIP][256] ([Intel XE#7178] / [Intel XE#7351]) +7 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][257] -> [SKIP][258] ([Intel XE#4141]) +23 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][259] -> [SKIP][260] ([Intel XE#2311]) +88 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][261] -> [SKIP][262] ([Intel XE#7061] / [Intel XE#7356]) +7 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][263] -> [SKIP][264] ([Intel XE#2352] / [Intel XE#7399]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][265] -> [SKIP][266] ([Intel XE#7061]) +5 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][267] -> [SKIP][268] ([Intel XE#2313]) +87 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][269] -> [SKIP][270] ([Intel XE#6911] / [Intel XE#7466])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          [SKIP][271] -> [SKIP][272] ([Intel XE#8348])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          [SKIP][273] -> [SKIP][274] ([Intel XE#7283]) +4 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][275] -> [SKIP][276] ([Intel XE#2393])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][277] -> [SKIP][278] ([Intel XE#5021] / [Intel XE#7377])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][279] -> [SKIP][280] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][281] -> [SKIP][282] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][283] -> [SKIP][284] ([Intel XE#6927])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][285] -> [SKIP][286] ([Intel XE#2505] / [Intel XE#7447])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][287] -> [SKIP][288] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][289] -> [SKIP][290] ([Intel XE#1489]) +14 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          [SKIP][291] -> [SKIP][292] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr@psr-suspend.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][293] -> [SKIP][294] ([Intel XE#2234])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr@psr2-primary-render.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][295] -> [SKIP][296] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][297] -> [SKIP][298] ([Intel XE#2330] / [Intel XE#5813])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][299] -> [SKIP][300] ([Intel XE#6503]) +3 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          [SKIP][301] -> [SKIP][302] ([Intel XE#8397])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][303] -> [SKIP][304] ([Intel XE#1499])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          [SKIP][305] -> [SKIP][306] ([Intel XE#6599])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_compute@eu-busy-10s.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_compute@eu-busy-10s.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [SKIP][307] -> [INCOMPLETE][308] ([Intel XE#6321] / [Intel XE#8355])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          [SKIP][309] -> [SKIP][310] ([Intel XE#8370]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_evict@evict-threads-small-multi-queue.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][311] -> [SKIP][312] ([Intel XE#2322] / [Intel XE#7372]) +11 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          [SKIP][313] -> [SKIP][314] ([Intel XE#8374]) +14 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          [SKIP][315] -> [SKIP][316] ([Intel XE#8364]) +42 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][317] -> [SKIP][318] ([Intel XE#8369]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
    - shard-bmg:          [SKIP][319] -> [SKIP][320] ([Intel XE#8378]) +11 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          [SKIP][321] -> [SKIP][322] ([Intel XE#7793]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_page_reclaim@prl-max-entries.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][323] -> [SKIP][324] ([Intel XE#2245] / [Intel XE#7590])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          [SKIP][325] -> [SKIP][326] ([Intel XE#7590])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][327] -> [SKIP][328] ([Intel XE#2284] / [Intel XE#7370])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][329] -> [SKIP][330] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][331] -> [SKIP][332] ([Intel XE#4733] / [Intel XE#7417]) +3 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][333] -> [SKIP][334] ([Intel XE#944]) +3 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
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
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8555]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8711]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8711
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc -> xe-pw-169654v7

  IGT_9032: 9032
  xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc: e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc
  xe-pw-169654v7: 169654v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/index.html

--===============4045827973265297272==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use IBC v3 on PTL (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169654/">https://patchwork.freedesktop.org/series/169654/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc_FULL -&gt; xe-pw-169654v7_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169654v7_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-169654v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-169654v7_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_addfb_basic@unused-handle.html">SKIP</a> +703 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset.html">SKIP</a> +175 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_module_load@many-reload.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_chamelium_color@gamma.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_pm_dc@dc3co-after-dc6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_pm_dc@dc3co-after-dc6.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_pat@pat-sw-hw-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_pm@d3cold-basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_pm@d3hot-i2c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc_FULL and xe-pw-169654v7_FULL:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169654v7_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-7/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-9/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-10/igt@xe_page_reclaim@boundary-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-1/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555">Intel XE#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8711">Intel XE#8711</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@fbdev@unaligned-write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> +995 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_content_protection@content-type-change.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_content_protection@legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_feature_discovery@dsc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel XE#6927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr@psr-suspend.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr@psr2-primary-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_compute@eu-busy-10s.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pat@pat-index-xelp.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-6/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169654v7/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc -&gt; xe-pw-169654v7</li>
</ul>
<p>IGT_9032: 9032<br />
  xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc: e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc<br />
  xe-pw-169654v7: 169654v7</p>

</body>
</html>

--===============4045827973265297272==--
