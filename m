Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3142EC54FCD
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 22:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7AF10E096;
	Wed, 29 Jul 2026 22:58:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C318810E07A;
 Wed, 29 Jul 2026 22:58:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8658657112901963954=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Increase_timeout?=
 =?utf-8?q?_for_hwmon_power_limit_mailbox_operations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jul 2026 22:58:35 -0000
Message-ID: <178536591574.2830.9589649365388973562@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
In-Reply-To: <20260729171546.3368457-1-karthik.poosa@intel.com>
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

--===============8658657112901963954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Increase timeout for hwmon power limit mailbox operations
URL   : https://patchwork.freedesktop.org/series/171303/
State : failure

== Summary ==

CI Bug Log - changes from xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7_FULL -> xe-pw-171303v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-171303v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-171303v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-171303v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@xe_module_load@reload-no-display.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_module_load@reload-no-display.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +655 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_sriov_vram@vf-access-provisioned.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_sriov_vram@vf-access-provisioned.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][5] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][7] ([Intel XE#2327]) -> [SKIP][8] +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][9] ([Intel XE#1124]) -> [SKIP][10] +11 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][11] ([Intel XE#7679]) -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][13] ([Intel XE#367]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][15] ([Intel XE#2887]) -> [SKIP][16] +13 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][17] ([Intel XE#3432]) -> [SKIP][18] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][19] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_cdclk@mode-transition-all-outputs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][21] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][22] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_chamelium_color@gamma.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          [SKIP][23] ([Intel XE#7358]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][25] ([Intel XE#2252]) -> [SKIP][26] +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][27] ([Intel XE#6507]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][29] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][31] ([Intel XE#7642]) -> [SKIP][32] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_content_protection@mei-interface.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [FAIL][33] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_content_protection@suspend-resume.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          [SKIP][35] ([Intel XE#2320]) -> [SKIP][36] +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][37] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][39] ([Intel XE#1508]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-bmg:          [SKIP][41] ([Intel XE#8265]) -> [SKIP][42] +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_dsc@dsc-basic-bigjoiner.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][43] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][45] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][47] ([Intel XE#2374] / [Intel XE#6128]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_feature_discovery@psr2.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][49] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][50] +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          [SKIP][51] ([Intel XE#7179]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][53] ([Intel XE#4141]) -> [SKIP][54] +9 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][55] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][56] +5 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][57] ([Intel XE#2311]) -> [SKIP][58] +57 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][59] ([Intel XE#7061]) -> [SKIP][60] +6 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          [SKIP][61] ([Intel XE#7399]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][63] ([Intel XE#2313]) -> [SKIP][64] +60 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][65] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][67] ([Intel XE#7283]) -> [SKIP][68] +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][69] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][71] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_pm_backlight@fade.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][73] ([Intel XE#8395] / [Intel XE#8396]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][75] ([Intel XE#3309] / [Intel XE#7368]) -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_pm_dc@dc5-retention-flops.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][77] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [SKIP][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][79] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][81] ([Intel XE#1489]) -> [SKIP][82] +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][83] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][84] +11 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][85] ([Intel XE#7795]) -> [SKIP][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][87] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][88] +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][89] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][90] +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          [SKIP][91] ([Intel XE#6503]) -> [SKIP][92] +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaler.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][93] ([Intel XE#2168] / [Intel XE#7444]) -> [SKIP][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_vrr@lobf.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_vrr@lobf.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          [SKIP][95] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][96] +7 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][97] ([Intel XE#8374]) -> [SKIP][98] +13 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
    - shard-bmg:          [SKIP][99] ([Intel XE#8364]) -> [SKIP][100] +26 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-bmg:          [SKIP][101] ([Intel XE#8369]) -> [SKIP][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_exec_reset@multi-queue-gt-reset.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          [SKIP][103] ([Intel XE#8378]) -> [SKIP][104] +11 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-rebind.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          [SKIP][105] ([Intel XE#7954]) -> [SKIP][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_gpgpu_fill@offset-4x4.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_page_reclaim@random:
    - shard-bmg:          [SKIP][107] ([Intel XE#7793]) -> [SKIP][108] +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@xe_page_reclaim@random.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_page_reclaim@random.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][109] ([Intel XE#1420] / [Intel XE#7590]) -> [SKIP][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][111] ([Intel XE#5694] / [Intel XE#7370]) -> [SKIP][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_pm@d3cold-i2c.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][113] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][114] +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][115] ([Intel XE#944]) -> [SKIP][116] +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_query@multigpu-query-invalid-size.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html

  
Known issues
------------

  Here are the changes found in xe-pw-171303v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#5177])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@intel_hwmon@hwmon-read.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@intel_hwmon@hwmon-read.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2652]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#6969]) +10 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#6969] / [Intel XE#7006])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][122] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#8303]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#8076])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][125] -> [FAIL][126] ([Intel XE#2029] / [Intel XE#7395])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [PASS][127] -> [SKIP][128] ([Intel XE#8710])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][129] -> [SKIP][130] ([Intel XE#2229]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@xe_live_ktest@xe_bo.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [PASS][131] -> [ABORT][132] ([Intel XE#3119])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-lnl-8/igt@xe_wedged@basic-wedged.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-lnl-7/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [FAIL][133] ([Intel XE#8711]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@core_getversion@all-cards.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@core_getversion@all-cards.html

  * igt@fbdev@pan:
    - shard-bmg:          [SKIP][135] ([Intel XE#2134]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@fbdev@pan.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@fbdev@pan.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][137] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][139] ([Intel XE#301]) -> [PASS][140] +2 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][141] ([Intel XE#1503]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][143] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map:
    - shard-bmg:          [DMESG-FAIL][145] ([Intel XE#8300]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [FAIL][147] -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_module_load@reload.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@xe_module_load@reload.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][149] -> [PASS][150] +792 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][151] -> [SKIP][152] ([Intel XE#2370])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          [SKIP][153] -> [SKIP][154] ([Intel XE#2327]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][155] -> [SKIP][156] ([Intel XE#7059] / [Intel XE#7085])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][157] -> [SKIP][158] ([Intel XE#1124]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][159] -> [SKIP][160] ([Intel XE#607] / [Intel XE#7361]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][161] -> [SKIP][162] ([Intel XE#7679]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][163] -> [SKIP][164] ([Intel XE#367]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          [SKIP][165] -> [SKIP][166] ([Intel XE#2887]) +14 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][167] -> [SKIP][168] ([Intel XE#2652])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][169] -> [SKIP][170] ([Intel XE#3432]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][171] -> [SKIP][172] ([Intel XE#2724] / [Intel XE#7449])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][173] -> [SKIP][174] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][175] -> [SKIP][176] ([Intel XE#2252]) +8 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][177] -> [SKIP][178] ([Intel XE#6969] / [Intel XE#7006])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][179] -> [SKIP][180] ([Intel XE#7642])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_content_protection@content-type-change.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][181] -> [SKIP][182] ([Intel XE#2390] / [Intel XE#6974])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          [SKIP][183] -> [SKIP][184] ([Intel XE#6974])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][185] -> [FAIL][186] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_content_protection@legacy.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][187] -> [SKIP][188] ([Intel XE#2320]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][189] -> [SKIP][190] ([Intel XE#2321] / [Intel XE#7355]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][191] -> [FAIL][192] ([Intel XE#7571])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][193] -> [SKIP][194] ([Intel XE#4210] / [Intel XE#7467])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][195] -> [SKIP][196] ([Intel XE#4354] / [Intel XE#5870])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-bmg:          [SKIP][197] -> [SKIP][198] ([Intel XE#8265]) +5 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][199] -> [SKIP][200] ([Intel XE#2372] / [Intel XE#7359])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][201] -> [SKIP][202] ([Intel XE#1138] / [Intel XE#7344])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_feature_discovery@display-4x.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][203] -> [SKIP][204] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          [SKIP][205] -> [SKIP][206] ([Intel XE#7179]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][207] -> [SKIP][208] ([Intel XE#7061] / [Intel XE#7356]) +6 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][209] -> [SKIP][210] ([Intel XE#4141]) +14 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][211] -> [SKIP][212] ([Intel XE#2311]) +63 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          [SKIP][213] -> [SKIP][214] ([Intel XE#7399])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][215] -> [SKIP][216] ([Intel XE#7061]) +6 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][217] -> [SKIP][218] ([Intel XE#2350] / [Intel XE#7503])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][219] -> [SKIP][220] ([Intel XE#2313]) +70 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][221] -> [SKIP][222] ([Intel XE#6901])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][223] -> [SKIP][224] ([Intel XE#7591])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][225] -> [SKIP][226] ([Intel XE#2486])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_panel_fitting@legacy.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][227] -> [SKIP][228] ([Intel XE#7283]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][229] -> [SKIP][230] ([Intel XE#5020] / [Intel XE#7348])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][231] -> [SKIP][232] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][233] -> [SKIP][234] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][235] -> [SKIP][236] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][237] -> [SKIP][238] ([Intel XE#1489]) +11 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][239] -> [SKIP][240] ([Intel XE#2234] / [Intel XE#2850]) +15 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][241] -> [SKIP][242] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][243] -> [SKIP][244] ([Intel XE#6503]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][245] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][246] ([Intel XE#1729] / [Intel XE#7424])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][247] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][248] ([Intel XE#2509] / [Intel XE#7437])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][249] -> [SKIP][250] ([Intel XE#2450] / [Intel XE#5857])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][251] -> [SKIP][252] ([Intel XE#1499])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][253] -> [SKIP][254] ([Intel XE#6599]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_evict@evict-cm-threads-small-multi-queue:
    - shard-bmg:          [SKIP][255] -> [SKIP][256] ([Intel XE#8370])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_evict@evict-cm-threads-small-multi-queue.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_evict@evict-cm-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][257] -> [SKIP][258] ([Intel XE#2322] / [Intel XE#7372]) +9 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][259] -> [SKIP][260] ([Intel XE#8374]) +14 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          [SKIP][261] -> [SKIP][262] ([Intel XE#8364]) +33 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][263] -> [SKIP][264] ([Intel XE#8369]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          [SKIP][265] -> [SKIP][266] ([Intel XE#8378]) +10 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          [SKIP][267] -> [ABORT][268] ([Intel XE#8007])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-bmg:          [SKIP][269] -> [SKIP][270] ([Intel XE#7793])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_page_reclaim@pde-vs-pd.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          [SKIP][271] -> [SKIP][272] ([Intel XE#7590])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][273] -> [SKIP][274] ([Intel XE#2284] / [Intel XE#7370]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][275] -> [SKIP][276] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          [SKIP][277] -> [SKIP][278] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][279] -> [SKIP][280] ([Intel XE#944]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [SKIP][281] -> [DMESG-WARN][282] ([Intel XE#6627] / [Intel XE#7419])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_survivability@runtime-survivability.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@xe_survivability@runtime-survivability.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8711]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8711
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7 -> xe-pw-171303v1

  IGT_9032: 9032
  xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7: c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7
  xe-pw-171303v1: 171303v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/index.html

--===============8658657112901963954==
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
<tr><td><b>Series:</b></td><td>drm/xe: Increase timeout for hwmon power limit mailbox operations</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171303/">https://patchwork.freedesktop.org/series/171303/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7_FULL -&gt; xe-pw-171303v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-171303v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-171303v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-171303v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_module_load@reload-no-display.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_sriov_vram@vf-access-provisioned.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_sriov_vram@vf-access-provisioned.html">SKIP</a> +655 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_chamelium_color@gamma.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_content_protection@mei-interface.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_content_protection@suspend-resume.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_feature_discovery@psr2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_backlight@fade.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html">SKIP</a> +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-rebind.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_page_reclaim@random.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_pm@d3cold-i2c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_pxp@display-pxp-fb.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-6/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-171303v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-3/igt@intel_hwmon@hwmon-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-lnl-6/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-lnl-8/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-lnl-7/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8711">Intel XE#8711</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-new-bo-map.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_module_load@reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +792 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_content_protection@content-type-change.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_content_protection@legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_panel_fitting@legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_evict@evict-cm-threads-small-multi-queue.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_evict@evict-cm-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-4/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7/shard-bmg-7/igt@xe_survivability@runtime-survivability.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171303v1/shard-bmg-1/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7 -&gt; xe-pw-171303v1</li>
</ul>
<p>IGT_9032: 9032<br />
  xe-5503-c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7: c4d059f5afac9b0a098bf41b26ae86e43fbfa2b7<br />
  xe-pw-171303v1: 171303v1</p>

</body>
</html>

--===============8658657112901963954==--
