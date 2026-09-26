Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABA5C9831E
	for <intel-xe@archiver.kernel.org>; Sat, 26 Sep 2026 06:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF54C10E14B;
	Sat, 26 Sep 2026 06:59:38 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939C610E074;
 Sat, 26 Sep 2026 06:59:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7753346865946579155=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_i2c=3A_designware=3A_Add_T?=
 =?utf-8?q?I_TDA54_I2C_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aniket Limaye" <a-limaye@ti.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 26 Sep 2026 06:59:37 -0000
Message-ID: <179040597757.210542.9548114034649192130@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260925-tda54-upstream-i2c-v3-0-544d74e992ff@ti.com>
In-Reply-To: <20260925-tda54-upstream-i2c-v3-0-544d74e992ff@ti.com>
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

--===============7753346865946579155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i2c: designware: Add TI TDA54 I2C support (rev2)
URL   : https://patchwork.freedesktop.org/series/175011/
State : success

== Summary ==

CI Bug Log - changes from xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74_FULL -> xe-pw-175011v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-175011v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1125] / [Intel XE#7312])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@intel_hwmon@hwmon-read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#5947])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5901]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1407])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2328] / [Intel XE#7367])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#5808]) +6 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#7679])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7679]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5823] / [Intel XE#6918]) +4 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#5822]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][19] ([Intel XE#7084] / [Intel XE#8150])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-ptl:          [PASS][20] -> [ABORT][21] ([Intel XE#9378]) +1 other test abort
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#3432])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +12 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2325] / [Intel XE#7358])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#8391]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7358]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#373]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#2252]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#6969]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-1:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#9333]) +24 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-1.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-2:
    - shard-lnl:          NOTRUN -> [FAIL][33] ([Intel XE#9333]) +9 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-2.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6969]) +15 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#6969]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#5832] / [Intel XE#6974])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6974]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#307] / [Intel XE#6974])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2320]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#5900]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1424])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#5962])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5962] / [Intel XE#7343])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#6035])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2286] / [Intel XE#6035])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#8265]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#8265]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-ptl:          NOTRUN -> [SKIP][52] ([Intel XE#5907]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4422] / [Intel XE#7442])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@display-4x:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#7344])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2375])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#8586])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@hdr:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#8586])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_feature_discovery@hdr.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#2316])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-ptl:          [PASS][59] -> [FAIL][60] ([Intel XE#3098] / [Intel XE#9171]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-8/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-3/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7179])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7178] / [Intel XE#7351])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7178] / [Intel XE#7349])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][64] ([Intel XE#7178]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7178] / [Intel XE#7351])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2311]) +44 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#7061] / [Intel XE#7356])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#5800] / [Intel XE#6312]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#6312]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7905]) +13 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4141]) +8 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#7061] / [Intel XE#7356])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2352] / [Intel XE#7399])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#6312]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#7865]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7061])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#7061]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#7865]) +7 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#7061])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2350] / [Intel XE#7503])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#5812]) +28 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#656] / [Intel XE#7905]) +9 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2313]) +44 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdmi_audio_bw@dpms-audio-recovery:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#9312])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][87] -> [INCOMPLETE][88] ([Intel XE#9320]) +1 other test incomplete
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-10/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#6901])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#7086] / [Intel XE#7390])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-ptl:          NOTRUN -> [SKIP][91] ([Intel XE#7591])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#7283]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#7283])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#7283]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#4596] / [Intel XE#5854])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#5879] / [Intel XE#7343])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#5959])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#6886]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-ptl:          NOTRUN -> [SKIP][102] ([Intel XE#8396]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2893] / [Intel XE#7304])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#4608])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#4608] / [Intel XE#7304])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#5858])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1489]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#7304])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2387] / [Intel XE#7429])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-suspend@edp-1:
    - shard-ptl:          [PASS][114] -> [ABORT][115] ([Intel XE#9362]) +2 other tests abort
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-6/igt@kms_psr@fbc-psr-suspend@edp-1.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-6/igt@kms_psr@fbc-psr-suspend@edp-1.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][116] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1406]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][118] ([Intel XE#1406]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-ptl:          NOTRUN -> [SKIP][121] ([Intel XE#5813])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#3904] / [Intel XE#7342])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#6503]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-ptl:          NOTRUN -> [SKIP][124] ([Intel XE#5848])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2168] / [Intel XE#7444])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1499] / [Intel XE#9271])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@suspend-resume:
    - shard-ptl:          NOTRUN -> [ABORT][127] ([Intel XE#9362]) +1 other test abort
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#7644])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_create@create-contexts:
    - shard-lnl:          [PASS][129] -> [ABORT][130] ([Intel XE#8007])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-3/igt@xe_create@create-contexts.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-4/igt@xe_create@create-contexts.html

  * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-beng-small:
    - shard-ptl:          NOTRUN -> [SKIP][132] ([Intel XE#5764]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#7482]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#7482]) +5 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_exec_balancer@twice-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1392]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-ptl:          NOTRUN -> [SKIP][136] ([Intel XE#5575] / [Intel XE#7484]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#8374]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#8374]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][140] ([Intel XE#8374]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#8364]) +17 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd-smem:
    - shard-ptl:          NOTRUN -> [SKIP][142] ([Intel XE#8364]) +10 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#8364]) +8 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#8369]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_reset@cm-multi-queue-close-fd:
    - shard-ptl:          NOTRUN -> [SKIP][145] ([Intel XE#8369]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_exec_reset@cm-multi-queue-close-fd.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][146] ([Intel XE#9130])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@xe_exec_reset@gt-reset-fault-injection.html
    - shard-lnl:          NOTRUN -> [DMESG-WARN][147] ([Intel XE#9130])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][148] ([Intel XE#7098] / [Intel XE#8159])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
    - shard-ptl:          NOTRUN -> [SKIP][149] ([Intel XE#6196])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][150] ([Intel XE#8378]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#8378]) +5 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2833])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_media_fill@media-fill.html

  * igt@xe_mempage_offline@inject-duplicate-page:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#9203])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_mempage_offline@inject-duplicate-page.html

  * igt@xe_mmap@pci-membarrier:
    - shard-ptl:          NOTRUN -> [SKIP][155] ([Intel XE#5100] / [Intel XE#7408])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_mmap@pci-membarrier.html

  * igt@xe_module_load@unload:
    - shard-bmg:          [PASS][156] -> [ABORT][157] ([Intel XE#8007]) +1 other test abort
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-8/igt@xe_module_load@unload.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-4/igt@xe_module_load@unload.html

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#6964]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_multigpu_svm@mgpu-coherency-conflict.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#6964])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-ptl:          NOTRUN -> [SKIP][160] ([Intel XE#6964]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#7793])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#7793])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-ptl:          NOTRUN -> [SKIP][163] ([Intel XE#7793])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2245] / [Intel XE#7590])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#7590])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-ptl:          NOTRUN -> [SKIP][166] ([Intel XE#5741])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][167] ([Intel XE#6867])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#584] / [Intel XE#7369])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-ptl:          NOTRUN -> [SKIP][170] ([Intel XE#6019])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#944]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#4130] / [Intel XE#7366])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#7569])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@xe_sriov_flr@flr-basic.html

  * igt@xe_survivability@i2c-functionality:
    - shard-ptl:          NOTRUN -> [SKIP][174] ([Intel XE#8415] / [Intel XE#8432])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_survivability@i2c-functionality.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [FAIL][175] -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@core_getversion@all-cards.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@core_getversion@all-cards.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [SKIP][177] -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@device_reset@unbind-reset-rebind.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][179] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [FAIL][181] ([Intel XE#6078]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:
    - shard-bmg:          [DMESG-WARN][183] ([Intel XE#9390]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][185] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-ptl:          [ABORT][187] ([Intel XE#9362]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][189] ([Intel XE#9365]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-10/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [ABORT][191] ([Intel XE#9093]) -> [PASS][192] +2 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [SKIP][193] ([Intel XE#8589]) -> [PASS][194] +145 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [FAIL][195] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-2/igt@kms_vrr@flip-basic-fastset.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [FAIL][197] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-3/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-bmg:          [ABORT][199] ([Intel XE#7893] / [Intel XE#9250] / [Intel XE#9279]) -> [PASS][200] +1 other test pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [DMESG-WARN][201] ([Intel XE#7774]) -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][203] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [FAIL][205] ([Intel XE#8578]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-race:
    - shard-bmg:          [ABORT][207] ([Intel XE#6652]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-race.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefetch-race.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [FAIL][209] ([Intel XE#9096] / [Intel XE#9297]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [FAIL][211] ([Intel XE#9096]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [SKIP][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-4/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-4/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-8/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-8/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-8/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-10/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-10/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-7/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-7/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-9/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-9/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-2/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-2/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-2/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-3/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-3/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-3/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-1/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-1/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-5/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-5/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-4/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-4/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-10/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-10/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-5/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-2/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-2/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-10/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][264] ([Intel XE#9362]) -> [PASS][265] +1 other test pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-8/igt@xe_pm@s4-basic.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][266] ([Intel XE#8589]) -> [SKIP][267] ([Intel XE#2327]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          [SKIP][268] ([Intel XE#8589]) -> [SKIP][269] ([Intel XE#1124])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][270] ([Intel XE#8589]) -> [SKIP][271] ([Intel XE#2652])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][272] ([Intel XE#8589]) -> [SKIP][273] ([Intel XE#2887]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - shard-bmg:          [SKIP][274] ([Intel XE#8589]) -> [SKIP][275] ([Intel XE#7358])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          [SKIP][276] ([Intel XE#8589]) -> [SKIP][277] ([Intel XE#2252]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:
    - shard-bmg:          [SKIP][278] ([Intel XE#8589]) -> [FAIL][279] ([Intel XE#9333])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][280] ([Intel XE#8589]) -> [SKIP][281] ([Intel XE#6974])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          [SKIP][282] ([Intel XE#8589]) -> [SKIP][283] ([Intel XE#2320]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][284] ([Intel XE#8589]) -> [SKIP][285] ([Intel XE#2321] / [Intel XE#7355])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][286] ([Intel XE#8589]) -> [SKIP][287] ([Intel XE#4331] / [Intel XE#7227])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][288] ([Intel XE#8589]) -> [SKIP][289] ([Intel XE#8265])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [FAIL][290] -> [SKIP][291] ([Intel XE#2311])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][292] ([Intel XE#8589]) -> [SKIP][293] ([Intel XE#7061]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][294] ([Intel XE#8589]) -> [SKIP][295] ([Intel XE#4141]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][296] ([Intel XE#8589]) -> [SKIP][297] ([Intel XE#7061] / [Intel XE#7356])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][298] ([Intel XE#8589]) -> [SKIP][299] ([Intel XE#2311]) +10 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][300] ([Intel XE#8589]) -> [SKIP][301] ([Intel XE#2313]) +13 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][302] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][303] ([Intel XE#3544])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][304] ([Intel XE#8589]) -> [SKIP][305] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][306] ([Intel XE#8589]) -> [SKIP][307] ([Intel XE#7283])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][308] ([Intel XE#8589]) -> [SKIP][309] ([Intel XE#5021] / [Intel XE#7377])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][310] ([Intel XE#8589]) -> [SKIP][311] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][312] ([Intel XE#8589]) -> [SKIP][313] ([Intel XE#2387] / [Intel XE#7429])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][314] ([Intel XE#8589]) -> [SKIP][315] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_psr@psr2-cursor-plane-move.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          [SKIP][316] ([Intel XE#8589]) -> [SKIP][317] ([Intel XE#6503])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_sharpness_filter@invalid-plane-with-filter.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][318] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][319] ([Intel XE#2426] / [Intel XE#5848])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][320] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][321] ([Intel XE#2509] / [Intel XE#7437])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          [SKIP][322] ([Intel XE#8589]) -> [SKIP][323] ([Intel XE#8370])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_evict@evict-small-multi-queue-priority-cm.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [SKIP][324] ([Intel XE#8589]) -> [SKIP][325] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [SKIP][326] ([Intel XE#8589]) -> [SKIP][327] ([Intel XE#8374]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          [SKIP][328] ([Intel XE#8589]) -> [SKIP][329] ([Intel XE#8364]) +6 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-cm-userptr:
    - shard-bmg:          [SKIP][330] ([Intel XE#8589]) -> [SKIP][331] ([Intel XE#8378])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-userptr.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-userptr.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-bmg:          [SKIP][332] ([Intel XE#8589]) -> [SKIP][333] ([Intel XE#7590])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][334] ([Intel XE#8589]) -> [SKIP][335] ([Intel XE#2284] / [Intel XE#7370])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_pm@d3cold-mocs.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_pm@d3cold-mocs.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][336] ([Intel XE#8589]) -> [SKIP][337] ([Intel XE#944])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5879
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947
  [Intel XE#5959]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5959
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9171]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9171
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9250
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9279
  [Intel XE#9297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9320
  [Intel XE#9333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378
  [Intel XE#9390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9390
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74 -> xe-pw-175011v2

  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74: d3e3b787ba0daa01200907e0efeaa3f7da201a74
  xe-pw-175011v2: 175011v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/index.html

--===============7753346865946579155==
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
<tr><td><b>Series:</b></td><td>i2c: designware: Add TI TDA54 I2C support (r=
ev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/175011/">https://patchwork.freedesktop.org/series/175011/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-175011v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-175011v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5827-d3e3b787ba0daa01200907e0efeaa3f7d=
a201a74_FULL -&gt; xe-pw-175011v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175011v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
25">Intel XE#1125</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7312">Intel XE#7312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5947">Intel XE#5947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5901">Intel XE#5901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_big_fb@linear-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-2-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_bw@linear-tiling-1-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_bw@linear-tiling-2-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_ccs@bad-rotation-90-4-til=
ed-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-c-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-6/=
igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378">Int=
el XE#9378</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-l=
ut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</=
p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lu=
t1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_chamelium_hpd@dp-hpd-fast=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_color_pipeline@plane-ctm3=
x4@pipe-a-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-=
d-plane-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_color_pipeline@plane-fixe=
d-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-d-plane-1.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a=
>) +24 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane=
-2:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_color_pipeline@plane-fixe=
d-matrix-yuv-rgb-bt709-lim@pipe-c-plane-2.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +9 o=
ther tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_color_pipeline@plane-lut1=
d-post-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +15 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_color_pipeline@plane-lut1=
d-pre-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5832">Intel XE#5832</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_content_protection@dp-mst=
-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_content_protection@lic-ty=
pe-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_cursor_crc@cursor-offscre=
en-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5900">Intel XE#5900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_cursor_legacy@2x-long-fli=
p-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_cursor_legacy@cursorb-vs-=
flipa-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035"=
>Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-ul=
trajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5907">Intel XE#5907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_feature_discovery@dsc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_feature_discovery@hdr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-8/igt@kms_flip=
@wf_vblank-ts-check@b-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-3/igt@kms_flip@wf_vblank=
-ts-check@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9171">Intel XE#9171</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#73=
51</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +44 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs=
-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5800">Intel XE#5800</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
hdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
hdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-=
abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbch=
dr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbch=
dr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbch=
dr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcp=
srhdr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7865">Intel XE#7865</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_frontbuffer_tracking@hdr-=
argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +28 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +=
9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psrh=
dr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +44 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@dpms-audio-recovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_hdmi_audio_bw@dpms-audio-=
recovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-10/igt@kms_hdr=
@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-1/i=
gt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9320">I=
ntel XE#9320</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_joiner@invalid-modeset-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7086">Intel XE#7086</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7390">Intel XE#7390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_plane@pixel-format-4-tile=
d-dg2-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_plane@pixel-format-4-tile=
d-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_plane@pixel-format-y-tile=
d-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_plane_multiple@2x-tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_plane_scaling@2x-scaler-m=
ulti-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5879">Intel XE#5879</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5959">Intel XE#5959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_plane_scaling@planes-down=
scale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_pm_backlight@bad-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_pm_dc@dc3co-after-dc6@pr-=
xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_pm_dc@dc3co-after-dc6@psr=
2-yuv420.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend@edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-6/igt@kms_psr@=
fbc-psr-suspend@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-6/igt@kms_psr@fbc-psr-suspend=
@edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_psr@fbc-psr2-no-drrs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@kms_psr@pr-primary-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_psr@pr-sprite-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@kms_psr@pr-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">=
Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@kms_sharpness_filter@filter-t=
oggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@kms_vrr@negative-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99">Intel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_ccs@suspend-resume.html">A=
BORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/93=
62">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@xe_ccs@vm-bind-fault-mode-dec=
ompress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-contexts:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-3/igt@xe_creat=
e@create-contexts.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-175011v2/shard-lnl-4/igt@xe_create@create-contexts.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_evict@evict-beng-cm-thread=
s-small-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_evict@evict-beng-small.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5764">Intel XE#5764</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_exec_balancer@twice-cm-vir=
tual-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_exec_balancer@twice-virtua=
l-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7482">Intel XE#7482</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefet=
ch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_exec_fault_mode@many-multi=
-queue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +17 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-=
cat-error-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-fd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_exec_reset@cm-multi-queue-=
close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@xe_exec_reset@gt-reset-fault-=
injection.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@xe_exec_reset@gt-reset-fault-=
injection.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@xe_exec_system_allocator@many=
-stride-new-prefetch.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma=
:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-comp-multi-vma.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_exec_threads@threads-multi=
-queue-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_exec_threads@threads-multi=
-queue-mixed-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-duplicate-page:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_mempage_offline@inject-dup=
licate-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_mmap@pci-membarrier.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
00">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-8/igt@xe_modul=
e_load@unload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-175011v2/shard-bmg-4/igt@xe_module_load@unload.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007=
">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_multigpu_svm@mgpu-coherenc=
y-conflict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_multigpu_svm@mgpu-coherenc=
y-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_multigpu_svm@mgpu-latency-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_page_reclaim@binds-1g-part=
ial.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_page_reclaim@invalid-1g.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_page_reclaim@pde-vs-pd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_pat@xa-app-transient-media=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5741">Intel XE#5741</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-7/igt@xe_pm@s3-vm-bind-prefetch.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6867">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_pm@s3-vm-bind-userptr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_query@multigpu-query-inval=
id-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-1/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@xe_sriov_flr@flr-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/75=
69">Intel XE#7569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@xe_survivability@i2c-function=
ality.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8415">Intel XE#8415</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@core_get=
version@all-cards.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@core_getversion@all-cards.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@device_r=
eset@unbind-reset-rebind.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@device_reset@unbind-=
reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6=
078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
75011v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#607=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
011v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe=
-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9390">Intel XE#93=
90</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
5011v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-d=
p-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel X=
E#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8150">Intel XE#8150</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs@pipe-b-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-7/igt@kms_fbco=
n_fbt@fbc-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-2/igt@kms_fbcon_fb=
t@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-=
10/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@kms_pipe=
_crc_basic@suspend-read-crc.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9093">Intel XE#9093</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@km=
s_pipe_crc_basic@suspend-read-crc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_prop=
erties@connector-properties-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/=
igt@kms_properties@connector-properties-legacy.html">PASS</a> +145 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-2/igt@kms_vrr@=
flip-basic-fastset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-ptl-3/ig=
t@kms_vrr@flip-basic-fastset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-ptl-2/igt@kms_vrr@=
flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/s=
hard-ptl-3/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-3/igt@xe_compu=
te_preempt@compute-preempt-many-vram.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7893">Intel XE#7893</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9250">Intel XE#9250=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9279"=
>Intel XE#9279</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_compute_preempt@compute-preempt-many-=
vram.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_compu=
te_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7774">Intel XE#7774</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_compute_preempt@compute=
-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1750=
11v2/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@xe_exec_=
fault_mode@atomic-many.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-5/igt@xe_exec_=
fault_mode@atomic-many.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-prefet=
ch-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-many-large-execqueues-malloc-prefetch-race.html">A=
BORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/66=
52">Intel XE#6652</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-175011v2/shard-bmg-3/igt@xe_exec_system_allocator@threads-many=
-large-execqueues-malloc-prefetch-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-6/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297">Int=
el XE#9297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-175011v2/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-inva=
lidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-1/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/sh=
ard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da20=
1a74/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f=
7da201a74/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0ef=
eaa3f7da201a74/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa0120090=
7e0efeaa3f7da201a74/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa012=
00907e0efeaa3f7da201a74/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0da=
a01200907e0efeaa3f7da201a74/shard-bmg-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787b=
a0daa01200907e0efeaa3f7da201a74/shard-bmg-7/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b=
787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-9/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5827-d=
3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-9/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-58=
27-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-2/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-2/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da20=
1a74/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#=
7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-175011v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-175011v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard=
-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-175011v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-175011v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard=
-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-175011v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-10/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-175011v2/shard-bmg-10/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-2/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-175011v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-8/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-175011v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-175011v2/shard-bmg-9/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-3/igt@xe_module_load@l=
oad.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-lnl-8/igt@xe_pm@s4=
-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175011v2/shard-lnl-8/igt@xe_pm@s4-basic.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-=
bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel =
XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_ccs@=
crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/i=
gt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shar=
d-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">In=
tel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_cham=
elium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel=
 XE#8589</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-175011v2/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-fixed-matri=
x-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_cham=
elium_hpd@dp-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_chamelium_=
hpd@dp-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_colo=
r_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/sha=
rd-bmg-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333">=
Intel XE#9333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6=
/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_curs=
or_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/=
igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7=
227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_dsc@=
dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/ig=
t@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">FAIL</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bm=
g-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
11">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/s=
hard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
61">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1750=
11v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/s=
hard-bmg-6/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
61">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-rende=
r:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Int=
el XE#8589</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-175011v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-prims=
crn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#858=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
011v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-5/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/ig=
t@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6=
912</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
75">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_plan=
e@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Inte=
l XE#8589</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-175011v2/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-m=
odifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_pm_b=
acklight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_p=
m_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#=
870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_psr2_su@=
page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_psr@=
psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@kms_psr@=
psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@kms_shar=
pness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bm=
g-6/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6=
503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shar=
d-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-6/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-175011v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_evict=
@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-=
6/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#=
8589</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
175011v2/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bas=
ic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_=
fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Inte=
l XE#8589</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-175011v2/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-userptr-i=
nvalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidat=
e:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_=
multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Int=
el XE#8589</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-175011v2/shard-bmg-6/igt@xe_exec_multi_queue@many-queues-preempt-mode=
-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_exec_=
threads@threads-multi-queue-cm-userptr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bm=
g-6/igt@xe_exec_threads@threads-multi-queue-cm-userptr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8=
378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_pat@l=
2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe=
_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_pm@d3=
cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/igt@xe_pm@d3cold-mocs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74/shard-bmg-5/igt@xe_query=
@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175011v2/shard-bmg-6/i=
gt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74 -&gt; xe-pw-175=
011v2</li>
</ul>
<p>IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5827-d3e3b787ba0daa01200907e0efeaa3f7da201a74: d3e3b787ba0daa01200907e=
0efeaa3f7da201a74<br />
  xe-pw-175011v2: 175011v2</p>

</body>
</html>

--===============7753346865946579155==--
