Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0833CC61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 15:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E41910F0D0;
	Thu, 27 Aug 2026 15:53:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0192410F0E6;
 Thu, 27 Aug 2026 15:53:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2501066036013835313=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_series_starting_with_=5Bv2?=
 =?utf-8?q?=2C1/2=5D_drm=3A_Add_common_drm=5Fuser=5Ffence_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Srinivasan Shanmugam" <srinivasan.shanmugam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Aug 2026 15:53:11 -0000
Message-ID: <178784599199.92683.8984374091451967638@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260827133226.4076593-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20260827133226.4076593-1-srinivasan.shanmugam@amd.com>
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

--===============2501066036013835313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v2,1/2] drm: Add common drm_user_fence helper
URL   : https://patchwork.freedesktop.org/series/172880/
State : success

== Summary ==

CI Bug Log - changes from xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60_FULL -> xe-pw-172880v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-172880v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [FAIL][1] ([Intel XE#8583])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1407])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7679])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][8] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2652]) +17 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2887])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2325] / [Intel XE#7358])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7358])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#373])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#6969]) +10 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2390] / [Intel XE#6974])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6974])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2320]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#309] / [Intel XE#7343])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4331] / [Intel XE#7227])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#8265])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#8265])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2375])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2374] / [Intel XE#6127])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#301]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#656] / [Intel XE#7905]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2311]) +22 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7061]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4141]) +7 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2352] / [Intel XE#7399])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7061] / [Intel XE#7356])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7865]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2313]) +21 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7905]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7061])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7308])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#1503])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4298] / [Intel XE#5873])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2486])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7283]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7283])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#5020] / [Intel XE#7348])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#8399])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1489]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1406])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1127] / [Intel XE#5813])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2413])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7482]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8374]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#8374])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#9003])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#8364]) +11 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#8364]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#6196])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#8378])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#8378]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [PASS][72] -> [ABORT][73] ([Intel XE#8007]) +1 other test abort
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#7793]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7590])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@xe_pm@d3hot-i2c.html

  * igt@xe_prefetch_fault@l2-prefetch-fault:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#8815])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_prefetch_fault@l2-prefetch-fault.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#944]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#4273])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#6569])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][82] ([Intel XE#7809]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - shard-bmg:          [DMESG-WARN][84] ([Intel XE#1727] / [Intel XE#6819]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-3/igt@kms_cursor_legacy@forked-bo@all-pipes.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_cursor_legacy@forked-bo@all-pipes.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-bmg:          [ABORT][86] ([Intel XE#8007]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [SKIP][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-9/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-2/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-5/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-5/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-9/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-2/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-2/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-10/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-10/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-6/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-4/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-5/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-1/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-1/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-1/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-6/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-7/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-4/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-8/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-7/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-7/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-10/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-3/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-8/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-1/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-9/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-9/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-3/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-3/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-7/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-9/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-5/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-5/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-8/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-8/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-8/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-1/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-1/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-7/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-4/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-4/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-3/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [ABORT][139] ([Intel XE#8963]) -> [DMESG-WARN][140] ([Intel XE#8963])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-lnl-8/igt@xe_wedged@basic-wedged.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60 -> xe-pw-172880v1

  IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60: c2f7f4803ab7055fa94f87bea53b90257d042c60
  xe-pw-172880v1: 172880v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/index.html

--===============2501066036013835313==
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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/2] drm: Add commo=
n drm_user_fence helper</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/172880/">https://patchwork.freedesktop.org/series/172880/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-172880v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-172880v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5653-c2f7f4803ab7055fa94f87bea53b90257=
d042c60_FULL -&gt; xe-pw-172880v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172880v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@intel_hwmon@hwmon-write.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
583">Intel XE#8583</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_bw@linear-tiling-3-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other t=
est incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +17 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-til=
ed-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_chamelium_color@ctm-0-25=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_chamelium_color_pipeline@=
plane-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_chamelium_edid@hdmi-edid=
-change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_color_pipeline@plane-lut=
3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_color_pipeline@plane-lut=
3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) =
+1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_content_protection@dp-ms=
t-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_content_protection@dp-mst=
-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-ul=
trajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_feature_discovery@dp-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-5/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drr=
shdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
hdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psrh=
dr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +21 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psrh=
dr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psrh=
dr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-172880v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8=
888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tile=
d-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_plane@pixel-format-yf-til=
ed-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_pm_backlight@basic-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-lnl-8/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-172880v1/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel=
 XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_psr@fbc-pr-primary-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_psr@pr-cursor-plane-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_exec_balancer@many-execque=
ues-parallel-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_exec_mix_modes@exec-multi-=
queue-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9003">Intel XE#9003</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +11 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-dyn-priority.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vm=
a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-comp-single-vma.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_exec_threads@threads-multi=
-queue-cm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate-rac=
e:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_exec_threads@threads-multi=
-queue-shared-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-10/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-b=
mg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@xe_page_reclaim@binds-1g-part=
ial.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@xe_pat@xa-app-transient-media=
-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@xe_pm@d3cold-mocs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/igt@xe_pm@d3hot-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Int=
el XE#5742</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7328">Intel XE#7328</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_prefetch_fault@l2-prefetch=
-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_sriov_flr@flr-twice.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
73">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-3/igt@kms_curs=
or_legacy@forked-bo@all-pipes.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1728=
80v1/shard-bmg-2/igt@kms_cursor_legacy@forked-bo@all-pipes.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-5/igt@xe_fault=
_injection@inject-fault-probe-function-xe_device_probe_early.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Int=
el XE#8007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-172880v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-funct=
ion-xe_device_probe_early.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d04=
2c60/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b902=
57d042c60/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea5=
3b90257d042c60/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f8=
7bea53b90257d042c60/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa=
94f87bea53b90257d042c60/shard-bmg-5/igt@xe_module_load@load.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab70=
55fa94f87bea53b90257d042c60/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803=
ab7055fa94f87bea53b90257d042c60/shard-bmg-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f=
4803ab7055fa94f87bea53b90257d042c60/shard-bmg-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5653-c=
2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-56=
53-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-7/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-b=
mg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c6=
0/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d0=
42c60/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172880v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-9/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-172880v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shar=
d-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172880v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-172880v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shar=
d-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172880v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-172880v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-10/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-172880v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-172880v1/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-172880v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-172880v1/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-bmg-3/igt@xe_module_load@l=
oad.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_wedged@basic-wedged:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60/shard-lnl-8/igt@xe_wedge=
d@basic-wedged.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-172880v1/shard-lnl-8/igt@xe_wedged@basic=
-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60 -&gt; xe-pw-172=
880v1</li>
</ul>
<p>IGT_9076: 8f42b0189d73d9912ad58c99cfaa4ff46c20fcc3 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5653-c2f7f4803ab7055fa94f87bea53b90257d042c60: c2f7f4803ab7055fa94f87b=
ea53b90257d042c60<br />
  xe-pw-172880v1: 172880v1</p>

</body>
</html>

--===============2501066036013835313==--
