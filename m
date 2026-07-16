Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E94BC44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 10:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF8810E328;
	Thu, 16 Jul 2026 10:53:21 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E4610E25E;
 Thu, 16 Jul 2026 10:53:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0290796621265560458=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc=3A_Hold_device_?=
 =?utf-8?q?ref_until_queue_teardown_completes_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jul 2026 10:53:21 -0000
Message-ID: <178419920125.197118.5318607541979899947@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260716062624.211396-1-arvind.yadav@intel.com>
In-Reply-To: <20260716062624.211396-1-arvind.yadav@intel.com>
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

--===============0290796621265560458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Hold device ref until queue teardown completes (rev10)
URL   : https://patchwork.freedesktop.org/series/168424/
State : failure

== Summary ==

CI Bug Log - changes from xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945_FULL -> xe-pw-168424v10_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168424v10_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168424v10_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168424v10_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_cursor@primary:
    - shard-bmg:          NOTRUN -> [FAIL][1] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_plane_cursor@primary.html

  
Known issues
------------

  Here are the changes found in xe-pw-168424v10_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d@basic:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#6011])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_3d@basic.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2233])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7059] / [Intel XE#7085])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#610] / [Intel XE#7387])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +13 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#7679]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#8365])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +16 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#3432]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652]) +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2724] / [Intel XE#7449])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2252])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#306] / [Intel XE#7358])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.html
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2325] / [Intel XE#7358])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7358]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +10 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#373])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6969]) +10 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#6974])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2390] / [Intel XE#6974])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#7642]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +5 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2320]) +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1424]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#7571])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2286] / [Intel XE#6035])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1508])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4354] / [Intel XE#7386])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#8265]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#8265]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6126] / [Intel XE#776])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2375])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#8586])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1421])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7179])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7178] / [Intel XE#7351])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7178] / [Intel XE#7351])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7178] / [Intel XE#7349]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#352])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#6312] / [Intel XE#651])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#4141]) +15 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7061] / [Intel XE#7356])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2311]) +64 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#6312]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7865]) +8 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7061]) +7 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7061])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2352] / [Intel XE#7399])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2313]) +66 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7905]) +11 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#3374] / [Intel XE#3544])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#4298] / [Intel XE#5873])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_joiner@basic-max-non-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4298] / [Intel XE#5873])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6911] / [Intel XE#7378])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2486])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8303]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7283])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7283]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2763] / [Intel XE#6886]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#8395]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#8396])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_pm_dc@dc3co-after-dc6@psr2.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2499])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#2893] / [Intel XE#7304])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1489]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2234])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#7795]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2330] / [Intel XE#5813])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#1435]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#6503])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2509] / [Intel XE#7437])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1499]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1499])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][92] -> [INCOMPLETE][93] ([Intel XE#6321] / [Intel XE#8355])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-external-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#8370])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_evict@evict-small-external-multi-queue.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#7482]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2322] / [Intel XE#7372]) +10 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1392]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#8374]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#8374]) +10 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#8364]) +34 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#8364]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_reset@cm-multi-queue-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#8369])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_reset@cm-multi-queue-close-fd.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#8369]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@process-many-stride-new-prefetch:
    - shard-bmg:          [PASS][105] -> [INCOMPLETE][106] ([Intel XE#8159])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-8/igt@xe_exec_system_allocator@process-many-stride-new-prefetch.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#8378]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#8378]) +12 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [PASS][109] -> [ABORT][110] ([Intel XE#8007]) +2 other tests abort
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135]) -> ([PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [SKIP][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161]) ([Intel XE#2457] / [Intel XE#7405])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-7/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-1/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-1/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-1/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-10/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-3/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-3/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-9/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-10/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-9/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-5/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-2/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-2/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-2/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-9/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-6/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-6/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-7/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-7/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-8/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-5/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-8/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-4/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-4/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-2/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-7/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-3/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-2/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-8/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-7/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-7/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-10/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-2/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-10/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-10/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#6964]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_multigpu_svm@mgpu-coherency-basic.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#7793]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][164] ([Intel XE#7695])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_pm@d3cold-basic.html
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2284] / [Intel XE#7370])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#7599])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#7599])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#944])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#944]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_scheduling@default-enabled-fair-scheduling:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#8339])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_sriov_scheduling@default-enabled-fair-scheduling.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt0-rcs0:
    - shard-bmg:          NOTRUN -> [FAIL][175] ([Intel XE#7992]) +1 other test fail
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt0-rcs0.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0:
    - shard-bmg:          NOTRUN -> [FAIL][176] ([Intel XE#8526])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-gt1-vcs0.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][177] ([Intel XE#7571]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [FAIL][179] ([Intel XE#3098]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][181] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][183] ([Intel XE#301]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - shard-bmg:          [FAIL][185] ([Intel XE#3321]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-10/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][187] ([Intel XE#2142]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:
    - shard-lnl:          [ABORT][189] ([Intel XE#8007]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-bmg:          [ABORT][191] ([Intel XE#8007]) -> [PASS][192] +5 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8526]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8526
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945 -> xe-pw-168424v10

  IGT_9007: 9007
  xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945: 6d15737b9d1d05c2107a1fab794dfc77f15dd945
  xe-pw-168424v10: 168424v10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/index.html

--===============0290796621265560458==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Hold device ref until queue tear=
down completes (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/168424/">https://patchwork.freedesktop.org/series/168424/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168424v10/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-168424v10/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5416-6d15737b9d1d05c2107a1fab794dfc77f=
15dd945_FULL -&gt; xe-pw-168424v10_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168424v10_FULL absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-168424v10_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1684=
24v10_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_cursor@primary:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_plane_cursor@primary.htm=
l">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168424v10_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_3d@basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011">Intel=
 XE#6011</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-ti=
led-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_big_fb@linear-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_bw@connected-linear-tili=
ng-4-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test =
skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_bw@connected-linear-tili=
ng-4-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_bw@linear-tiling-2-displ=
ays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_ccs@bad-pixel-format-4-t=
iled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-=
tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-=
yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_cdclk@plane-scaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_chamelium_audio@hdmi-aud=
io-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7358">Intel XE#7358</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_chamelium_color@ctm-0-75=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_chamelium_color_pipeline=
@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid=
-change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +10 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_chamelium_frames@hdmi-cm=
p-planar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_color_pipeline@plane-lut=
3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_color_pipeline@plane-lut=
3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_content_protection@dp-ms=
t-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_content_protection@lic-t=
ype-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_content_protection@suspe=
nd-resume.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +5 other=
 tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_cursor_crc@cursor-offscr=
een-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@kms_cursor_crc@cursor-random=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_cursor_crc@cursor-slidin=
g-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-7/igt@kms_cursor_l=
egacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#603=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioc=
tl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_dp_link_training@uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-b=
igjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-b=
igjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_fbcon_fbt@psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126">=
Intel XE#6126</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@kms_feature_discovery@dp-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_feature_discovery@dsc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32b=
pp-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32b=
pp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#735=
1</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32b=
pp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#735=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#=
7349</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_force_connector_basic@fo=
rce-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@drr=
s-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc=
-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +15 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc=
-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc=
drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +64=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
drrshdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
hdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc=
hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +7 other tests ski=
p</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc=
psr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc=
psrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +66 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
psrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_joiner@basic-max-non-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4298">Intel XE#4298</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_joiner@basic-max-non-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4298">Intel XE#4298</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_panel_fitting@atomic-fas=
tset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8=
888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_plane@pixel-format-4-til=
ed-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_plane@pixel-format-4-til=
ed-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_plane@pixel-format-y-til=
ed-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#68=
86</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_pm_backlight@bad-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_pm_dc@dc3co-after-dc6.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8395">Intel XE#8395</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_pm_dc@dc3co-after-dc6@ps=
r2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@kms_pm_lpsp@kms-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/249=
9">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-p=
lane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_psr@psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_psr@psr2-sprite-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_rotation_crc@primary-y-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other tes=
t skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_setmode@basic-clone-sing=
le-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@kms_sharpness_filter@filter-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-v=
rr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-6/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-7/igt@xe_evic=
t@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel X=
E#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_evict@evict-beng-threads-=
large-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_evict@evict-small-externa=
l-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_balancer@many-cm-vir=
tual-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372"=
>Intel XE#7372</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_basic@multigpu-no-ex=
ec-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_fault_mode@many-mult=
i-queue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_exec_fault_mode@twice-mul=
ti-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +10 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_exec_multi_queue@few-exec=
s-preempt-mode-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +34 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_multi_queue@two-queu=
es-preempt-mode-fault-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_reset@cm-multi-queue=
-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_exec_reset@multi-queue-ca=
t-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-8/igt@xe_exec_=
system_allocator@process-many-stride-new-prefetch.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-=
3/igt@xe_exec_system_allocator@process-many-stride-new-prefetch.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_exec_threads@threads-mult=
i-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@xe_exec_threads@threads-mult=
i-queue-mixed-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-1/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_run.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/i=
gt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE=
#8007</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd94=
5/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15=
dd945/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc7=
7f15dd945/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794=
dfc77f15dd945/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1=
fab794dfc77f15dd945/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c21=
07a1fab794dfc77f15dd945/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d0=
5c2107a1fab794dfc77f15dd945/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9=
d1d05c2107a1fab794dfc77f15dd945/shard-bmg-2/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6d157=
37b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5416-6=
d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-9/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-54=
16-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-2/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shar=
d-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-7/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168424v10/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168424v10/shard-bmg-4/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-2/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168424v10/shard-bmg-9/igt@xe_module_load@load.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1684=
24v10/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-168424v10/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-=
bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-10/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168424v10/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-168424v10/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/=
shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-10/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-168424v10/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
424v10/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel X=
E#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_multigpu_svm@mgpu-coheren=
cy-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_page_reclaim@boundary-spl=
it.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-9/igt@xe_pat@pat-sw-hw-suspend.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-6/igt@xe_peer2peer@read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">=
Intel XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_pm@d3cold-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@xe_pm@d3cold-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_pm_residency@cpg-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@xe_prefetch_fault@prefetch-f=
ault-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7599">Intel XE#7599</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_prefetch_fault@prefetch-f=
ault-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_query@multigpu-query-inva=
lid-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-1/igt@xe_query@multigpu-query-inva=
lid-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@default-enabled-fair-scheduling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-lnl-7/igt@xe_sriov_scheduling@default-=
enabled-fair-scheduling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-g=
t0-rcs0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_sriov_scheduling@equal-th=
roughput-normal-priority@numvfs-random-gt0-rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>=
) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority@numvfs-random-g=
t1-vcs0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168424v10/shard-bmg-5/igt@xe_sriov_scheduling@equal-th=
roughput-normal-priority@numvfs-random-gt1-vcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8526">Intel XE#8526</a>=
)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-4/i=
gt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-5/igt@kms_flip=
@2x-dpms-vs-vblank-race-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bm=
g-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE=
#3149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-168424v10/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-=
edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-lnl-1/igt@k=
ms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-7/igt@kms_flip=
@flip-vs-expired-vblank@c-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-bmg-10=
/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-lnl-7/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168424v10/shard-=
lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1=
 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-race.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#=
8007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
168424v10/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-l=
arge-new-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945/shard-bmg-7/igt@xe_fault=
_injection@inject-fault-probe-function-xe_device_probe_early.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Int=
el XE#8007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-168424v10/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-funct=
ion-xe_device_probe_early.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945 -&gt; xe-pw-168=
424v10</li>
</ul>
<p>IGT_9007: 9007<br />
  xe-5416-6d15737b9d1d05c2107a1fab794dfc77f15dd945: 6d15737b9d1d05c2107a1fa=
b794dfc77f15dd945<br />
  xe-pw-168424v10: 168424v10</p>

</body>
</html>

--===============0290796621265560458==--
