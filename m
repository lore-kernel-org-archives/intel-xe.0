Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F220C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 04:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BACE10E103;
	Thu, 30 Jul 2026 04:03:21 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084FC10E0F3;
 Thu, 30 Jul 2026 04:03:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6892668319091284308=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Changes_for_Xe3p?=
 =?utf-8?q?=5FHPM_media_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jul 2026 04:03:21 -0000
Message-ID: <178538420101.3374.2201246958389590609@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260729230645.3052178-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260729230645.3052178-1-ashutosh.dixit@intel.com>
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

--===============6892668319091284308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Changes for Xe3p_HPM media (rev4)
URL   : https://patchwork.freedesktop.org/series/171088/
State : failure

== Summary ==

CI Bug Log - changes from xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc_FULL -> xe-pw-171088v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-171088v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-171088v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-171088v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +699 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_addfb_basic@unused-handle.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][3] +175 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_module_load@many-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][6] ([Intel XE#2327]) -> [SKIP][7] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][8] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][9] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][10] ([Intel XE#1124]) -> [SKIP][11] +12 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][12] ([Intel XE#7679]) -> [SKIP][13] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][14] ([Intel XE#367]) -> [SKIP][15] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][16] ([Intel XE#2887]) -> [SKIP][17] +12 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][18] ([Intel XE#7084] / [Intel XE#8150]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][20] ([Intel XE#3432]) -> [SKIP][21] +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][22] ([Intel XE#2652]) -> [SKIP][23] +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          [SKIP][24] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          [SKIP][26] ([Intel XE#7358]) -> [SKIP][27] +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][28] ([Intel XE#2252]) -> [SKIP][29] +9 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][30] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][32] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][34] ([Intel XE#6974]) -> [SKIP][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [FAIL][36] ([Intel XE#6707] / [Intel XE#7439]) -> [SKIP][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][38] ([Intel XE#2320]) -> [SKIP][39] +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][40] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][42] ([Intel XE#2286] / [Intel XE#6035]) -> [SKIP][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-bmg:          [SKIP][44] ([Intel XE#8265]) -> [SKIP][45] +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][46] ([Intel XE#8680]) -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][48] ([Intel XE#2374] / [Intel XE#6127]) -> [SKIP][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_feature_discovery@psr1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          [SKIP][50] ([Intel XE#7179]) -> [SKIP][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][52] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][54] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][55] +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][56] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][57] +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][58] ([Intel XE#4141]) -> [SKIP][59] +18 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][60] ([Intel XE#2311]) -> [SKIP][61] +57 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][62] ([Intel XE#2313]) -> [SKIP][63] +61 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][64] ([Intel XE#7061]) -> [SKIP][65] +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          [SKIP][66] ([Intel XE#7283]) -> [SKIP][67] +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][68] ([Intel XE#2393]) -> [SKIP][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][70] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][71] +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          [SKIP][72] ([Intel XE#8395] / [Intel XE#8396]) -> [SKIP][73] +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_pm_dc@dc3co-after-dc6.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][74] ([Intel XE#1489]) -> [SKIP][75] +7 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][76] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][78] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][79] +12 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][80] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][82] ([Intel XE#1435] / [Intel XE#8695]) -> [SKIP][83] +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          [SKIP][84] ([Intel XE#6503]) -> [SKIP][85] +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_sharpness_filter@filter-dpms.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_sharpness_filter@filter-dpms.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][86] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][88] ([Intel XE#1499]) -> [SKIP][89] +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_vrr@max-min.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_vrr@max-min.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][90] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350]) -> [SKIP][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][92] ([Intel XE#8370]) -> [SKIP][93] +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-cm.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][94] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][95] +10 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-bmg:          [SKIP][96] ([Intel XE#8374]) -> [SKIP][97] +17 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-imm.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_multi_queue@one-queue-priority-smem:
    - shard-bmg:          [SKIP][98] ([Intel XE#8364]) -> [SKIP][99] +33 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-priority-smem.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-priority-smem.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          [SKIP][100] ([Intel XE#8369]) -> [SKIP][101] +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-bmg:          [SKIP][102] ([Intel XE#8378]) -> [SKIP][103] +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][104] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384]) -> [SKIP][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_mmap@small-bar.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][106] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393]) -> [SKIP][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          [SKIP][108] ([Intel XE#7793]) -> [SKIP][109] +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_page_reclaim@invalid-1g.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          [FAIL][110] ([Intel XE#7695]) -> [SKIP][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_pat@pat-sw-hw-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][112] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][113] +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_pm@d3cold-basic.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][114] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400]) -> [SKIP][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][116] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][117] +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][118] ([Intel XE#944]) -> [SKIP][119] +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [DMESG-WARN][120] ([Intel XE#5545]) -> [SKIP][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html

  
New tests
---------

  New tests have been introduced between xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc_FULL and xe-pw-171088v4_FULL:

### New IGT tests (4) ###

  * igt@kms_async_flips@async-flip-hang@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@async-flip-hang@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@kms_async_flips@async-flip-hang@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@kms_async_flips@async-flip-hang@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  

Known issues
------------

  Here are the changes found in xe-pw-171088v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [PASS][122] -> [SKIP][123] ([Intel XE#2134])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@fbdev@unaligned-read.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@fbdev@unaligned-read.html

  * igt@fbdev@write:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2134])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@fbdev@write.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][125] -> [SKIP][126] ([Intel XE#5177])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2327]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#607] / [Intel XE#7361])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2328] / [Intel XE#7367])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1124]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#7679])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2887]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2652]) +15 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2325] / [Intel XE#7358])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#7358])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2252]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#6969]) +10 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#6974])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][140] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][141] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#4354] / [Intel XE#5870])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#8265]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#1138] / [Intel XE#7344])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][146] -> [FAIL][147] ([Intel XE#301])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#7061]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#4141]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2311]) +25 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#7399])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2352] / [Intel XE#7399])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2313]) +27 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#6901])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#7283]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#8076])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-framegap.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#8396]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#1489]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2387] / [Intel XE#7429])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2330] / [Intel XE#5813])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#6503])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#6599])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          NOTRUN -> [FAIL][168] ([Intel XE#8578])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#8374]) +7 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#8364]) +14 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#8369])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#8378]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [PASS][173] -> [ABORT][174] ([Intel XE#8007])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#6964])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#7793])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#7590])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#944])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [ABORT][179] ([Intel XE#8007]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@core_hotunplug@hotunbind-rebind.html

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][181] ([Intel XE#2134]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@fbdev@eof.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@fbdev@eof.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [SKIP][183] ([Intel XE#5177]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@intel_hwmon@hwmon-read.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@intel_hwmon@hwmon-read.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][185] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][187] -> [PASS][188] +820 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [SKIP][189] ([Intel XE#2229]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-bmg:          [FAIL][191] ([Intel XE#8555]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_pmu@engine-activity-accuracy-50.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-2/igt@xe_pmu@engine-activity-accuracy-50.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][193] -> [SKIP][194] ([Intel XE#2327]) +5 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][195] -> [SKIP][196] ([Intel XE#7059] / [Intel XE#7085])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][197] -> [SKIP][198] ([Intel XE#1124]) +12 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][199] -> [SKIP][200] ([Intel XE#7679]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][201] -> [SKIP][202] ([Intel XE#367]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][203] -> [SKIP][204] ([Intel XE#2652]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][205] -> [SKIP][206] ([Intel XE#3432]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][207] -> [SKIP][208] ([Intel XE#2887]) +18 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][209] -> [SKIP][210] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          [SKIP][211] -> [SKIP][212] ([Intel XE#7358])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][213] -> [SKIP][214] ([Intel XE#2252]) +8 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][215] -> [SKIP][216] ([Intel XE#6507])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][217] -> [SKIP][218] ([Intel XE#7642]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_content_protection@content-type-change.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][219] -> [FAIL][220] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_content_protection@legacy.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][221] -> [SKIP][222] ([Intel XE#2320]) +9 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][223] -> [SKIP][224] ([Intel XE#2321] / [Intel XE#7355])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][225] -> [SKIP][226] ([Intel XE#2286] / [Intel XE#6035])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][227] -> [SKIP][228] ([Intel XE#1508])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][229] -> [SKIP][230] ([Intel XE#4354] / [Intel XE#7386])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][231] -> [SKIP][232] ([Intel XE#4331] / [Intel XE#7227])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-bmg:          [SKIP][233] -> [SKIP][234] ([Intel XE#8265]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dsc@dsc-basic-bigjoiner.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][235] -> [SKIP][236] ([Intel XE#4422] / [Intel XE#7442])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][237] -> [SKIP][238] ([Intel XE#8680])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_fbcon_fbt@psr.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][239] -> [SKIP][240] ([Intel XE#2372] / [Intel XE#7359])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dsc:
    - shard-bmg:          [SKIP][241] -> [SKIP][242] ([Intel XE#8586])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_feature_discovery@dsc.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][243] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][244] ([Intel XE#301])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][245] -> [SKIP][246] ([Intel XE#7178] / [Intel XE#7349])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][247] -> [SKIP][248] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          [SKIP][249] -> [SKIP][250] ([Intel XE#7179]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][251] -> [SKIP][252] ([Intel XE#4141]) +21 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][253] -> [SKIP][254] ([Intel XE#2311]) +73 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][255] -> [SKIP][256] ([Intel XE#7061] / [Intel XE#7356]) +7 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][257] -> [SKIP][258] ([Intel XE#2352] / [Intel XE#7399]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][259] -> [SKIP][260] ([Intel XE#7061]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][261] -> [SKIP][262] ([Intel XE#2313]) +71 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][263] -> [SKIP][264] ([Intel XE#6911] / [Intel XE#7466])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          [SKIP][265] -> [SKIP][266] ([Intel XE#8348])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          [SKIP][267] -> [SKIP][268] ([Intel XE#7283]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][269] -> [SKIP][270] ([Intel XE#2393])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][271] -> [SKIP][272] ([Intel XE#5021] / [Intel XE#7377])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][273] -> [SKIP][274] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][275] -> [SKIP][276] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][277] -> [SKIP][278] ([Intel XE#6927])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][279] -> [SKIP][280] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][281] -> [SKIP][282] ([Intel XE#1489]) +12 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          [SKIP][283] -> [SKIP][284] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr@psr-suspend.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][285] -> [SKIP][286] ([Intel XE#2234])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr@psr2-primary-render.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][287] -> [SKIP][288] ([Intel XE#2330] / [Intel XE#5813])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][289] -> [SKIP][290] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][291] -> [SKIP][292] ([Intel XE#6503]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][293] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][294] ([Intel XE#2426] / [Intel XE#5848])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][295] -> [SKIP][296] ([Intel XE#2168] / [Intel XE#7444])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_vrr@lobf.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          [SKIP][297] -> [SKIP][298] ([Intel XE#8397])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][299] -> [SKIP][300] ([Intel XE#1499])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [SKIP][301] -> [INCOMPLETE][302] ([Intel XE#6321] / [Intel XE#8355])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          [SKIP][303] -> [SKIP][304] ([Intel XE#8370]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_evict@evict-threads-small-multi-queue.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          [SKIP][305] -> [SKIP][306] ([Intel XE#2322] / [Intel XE#7372]) +9 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          [SKIP][307] -> [SKIP][308] ([Intel XE#8374]) +13 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          [SKIP][309] -> [SKIP][310] ([Intel XE#8364]) +37 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][311] -> [SKIP][312] ([Intel XE#8369]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
    - shard-bmg:          [SKIP][313] -> [SKIP][314] ([Intel XE#8378]) +11 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:
    - shard-bmg:          [SKIP][315] -> [ABORT][316] ([Intel XE#8007]) +1 other test abort
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          [SKIP][317] -> [SKIP][318] ([Intel XE#7793]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_page_reclaim@prl-max-entries.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][319] -> [SKIP][320] ([Intel XE#2245] / [Intel XE#7590])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          [SKIP][321] -> [SKIP][322] ([Intel XE#7590])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][323] -> [SKIP][324] ([Intel XE#2284] / [Intel XE#7370])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][325] -> [SKIP][326] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          [SKIP][327] -> [SKIP][328] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pxp@pxp-optout.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][329] -> [SKIP][330] ([Intel XE#944]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_query@multigpu-query-mem-usage.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
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
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
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
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
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
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc -> xe-pw-171088v4

  IGT_9032: 9032
  xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc: e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc
  xe-pw-171088v4: 171088v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/index.html

--===============6892668319091284308==
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
<tr><td><b>Series:</b></td><td>drm/xe: Changes for Xe3p_HPM media (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171088/">https://patchwork.freedesktop.org/series/171088/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc_FULL -&gt; xe-pw-171088v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-171088v4_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-171088v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-171088v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_addfb_basic@unused-handle.html">SKIP</a> +699 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset.html">SKIP</a> +175 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_module_load@many-reload.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_pm_dc@dc3co-after-dc6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_pm_dc@dc3co-after-dc6.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-imm.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-priority-smem.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_mmap@small-bar.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_pat@pat-sw-hw-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_pat@pat-sw-hw-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_pm@d3cold-basic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_pm@d3hot-i2c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc_FULL and xe-pw-171088v4_FULL:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-171088v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-8/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-3/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-7/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-framegap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_page_reclaim@boundary-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-3/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@intel_hwmon@hwmon-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> +820 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-4/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555">Intel XE#8555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-2/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_content_protection@content-type-change.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_content_protection@legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_feature_discovery@dsc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel XE#6927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr@psr-suspend.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_psr@psr2-primary-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pat@pat-index-xelp.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-6/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_pxp@pxp-optout.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-8/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171088v4/shard-bmg-10/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc -&gt; xe-pw-171088v4</li>
</ul>
<p>IGT_9032: 9032<br />
  xe-5506-e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc: e43bb9c0c12cffebb4fae29c6f06d0901f1b5dcc<br />
  xe-pw-171088v4: 171088v4</p>

</body>
</html>

--===============6892668319091284308==--
