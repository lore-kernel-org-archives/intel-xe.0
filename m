Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE47C87FCB
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 11:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F7510E198;
	Mon,  4 Aug 2025 11:52:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2194A10E198;
 Mon,  4 Aug 2025 11:52:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8394329491432809759=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_Fix_coverity_iss?=
 =?utf-8?q?ue=2C_cast=5Foverflow?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Aug 2025 11:52:04 -0000
Message-ID: <175430832411.209865.3430965865778176060@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250804094038.3301004-1-pravalika.gurram@intel.com>
In-Reply-To: <20250804094038.3301004-1-pravalika.gurram@intel.com>
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

--===============8394329491432809759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix coverity issue, cast_overflow
URL   : https://patchwork.freedesktop.org/series/152479/
State : success

== Summary ==

CI Bug Log - changes from xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6_FULL -> xe-pw-152479v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-152479v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#4672])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@core_getversion@basic.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#4963])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@core_hotunplug@unplug-rescan.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#2134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@fbdev@unaligned-write.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@fbdev@unaligned-write.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#4950]) +83 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_addfb_basic@bad-pitch-999.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#316]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#610])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#610])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][14] -> [DMESG-FAIL][15] ([Intel XE#4543])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2191]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#367]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#4947]) +14 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +111 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3432])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#787]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#2705] / [Intel XE#4212])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#4416]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#455])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#306])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#373]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2252])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1178])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2320]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#4494] / [i915#3804])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2373])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#703])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2316]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][45] -> [INCOMPLETE][46] ([Intel XE#2049] / [Intel XE#2597])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#301])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#301] / [Intel XE#3149])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][51] -> [DMESG-WARN][52] ([Intel XE#4543]) +5 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#455]) +9 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2380])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2293]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#5390]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#651]) +12 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#653]) +13 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2313]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2934])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#2925])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#356])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#5021])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2763]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#4962])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_pm_rpm@drm-resources-equal.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1489]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1489])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1122])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#3414])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#3414] / [Intel XE#3904])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2413])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#1499])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_vrr@flip-basic.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4837]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#4837]) +6 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#4945]) +414 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2322]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#1392]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1392]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#288]) +12 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][87] -> [DMESG-WARN][88] ([Intel XE#3876])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#4943]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-new-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#4915]) +122 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-stride-new-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#5018])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#2229]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#3573]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#5694])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [PASS][97] -> [DMESG-WARN][98] ([Intel XE#2953] / [Intel XE#4173]) +9 other tests dmesg-warn
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2284] / [Intel XE#366])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#4650])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4733])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#4733]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#944]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#944])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#4351])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          [FAIL][106] ([Intel XE#4672]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@core_getversion@all-cards.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-adlp:         [SKIP][108] ([Intel XE#4963]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][110] ([Intel XE#4674]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][112] ([Intel XE#2134]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@fbdev@unaligned-read.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@fbdev@unaligned-read.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [SKIP][114] ([Intel XE#5177]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@intel_hwmon@hwmon-read.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@size-max:
    - shard-adlp:         [DMESG-WARN][116] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][117] +2 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-2/igt@kms_addfb_basic@size-max.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-6/igt@kms_addfb_basic@size-max.html

  * igt@kms_atomic_interruptible@legacy-cursor:
    - shard-adlp:         [SKIP][118] ([Intel XE#4950]) -> [PASS][119] +10 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_atomic_interruptible@legacy-cursor.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_atomic_interruptible@legacy-cursor.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [SKIP][120] ([Intel XE#4947]) -> [PASS][121] +19 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_big_fb@x-tiled-addfb.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][122] ([Intel XE#4543]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][124] ([Intel XE#4947]) -> [PASS][125] +6 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][126] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][128] ([Intel XE#3862]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][134] ([Intel XE#2291]) -> [PASS][135] +2 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][136] ([Intel XE#4633]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][138] ([Intel XE#4294]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][140] ([Intel XE#2316]) -> [PASS][141] +3 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          [FAIL][142] ([Intel XE#5338]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][144] ([Intel XE#301]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][146] ([Intel XE#5208]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][148] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][150] ([Intel XE#4543]) -> [PASS][151] +5 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [SKIP][152] ([Intel XE#4950]) -> [PASS][153] +72 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_plane_scaling@intel-max-src-size.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [SKIP][154] ([Intel XE#4962]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [FAIL][156] ([Intel XE#2883]) -> [PASS][157] +1 other test pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-3/igt@kms_setmode@basic.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-4/igt@kms_setmode@basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1392]) -> [PASS][159] +3 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [DMESG-WARN][160] ([Intel XE#3876]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-adlp:         [DMESG-FAIL][162] ([Intel XE#3876]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-3/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-cm-fd-basic:
    - shard-adlp:         [FAIL][164] -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-1/igt@xe_exec_threads@threads-cm-fd-basic.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-3/igt@xe_exec_threads@threads-cm-fd-basic.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-dg2-set2:     [DMESG-WARN][166] ([Intel XE#3876]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [INCOMPLETE][168] -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [SKIP][170] ([Intel XE#4945]) -> [PASS][171] +417 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_spin_batch@spin-all.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_spin_batch@spin-all.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial:
    - shard-adlp:         [SKIP][172] ([Intel XE#4945]) -> [PASS][173] +22 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_vm@munmap-style-unbind-either-side-partial.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_vm@munmap-style-unbind-either-side-partial.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][174] ([Intel XE#2370]) -> [SKIP][175] ([Intel XE#4950]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][176] ([Intel XE#4947]) -> [SKIP][177] ([Intel XE#2327]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][178] ([Intel XE#2327]) -> [SKIP][179] ([Intel XE#4947]) +4 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-adlp:         [SKIP][180] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][181] ([Intel XE#316])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][182] ([Intel XE#607]) -> [SKIP][183] ([Intel XE#4947])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][184] ([Intel XE#610]) -> [SKIP][185] ([Intel XE#4947])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [SKIP][186] ([Intel XE#4947]) -> [SKIP][187] ([Intel XE#1124])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][188] ([Intel XE#4947]) -> [SKIP][189] ([Intel XE#1124]) +10 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [SKIP][190] ([Intel XE#1124]) -> [SKIP][191] ([Intel XE#4947]) +6 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][192] ([Intel XE#4950]) -> [SKIP][193] ([Intel XE#2314] / [Intel XE#2894])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][194] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][195] ([Intel XE#4950])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         [SKIP][196] ([Intel XE#4950]) -> [SKIP][197] ([Intel XE#2191])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][198] ([Intel XE#4950]) -> [SKIP][199] ([Intel XE#367]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][200] ([Intel XE#367]) -> [SKIP][201] ([Intel XE#4950]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][202] ([Intel XE#2887]) -> [SKIP][203] ([Intel XE#4947]) +14 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][204] ([Intel XE#4947]) -> [SKIP][205] ([Intel XE#2652] / [Intel XE#787]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][206] ([Intel XE#4947]) -> [SKIP][207] ([Intel XE#2887]) +12 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-adlp:         [SKIP][208] ([Intel XE#4947]) -> [SKIP][209] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][210] ([Intel XE#3432]) -> [SKIP][211] ([Intel XE#4947]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][212] ([Intel XE#4947]) -> [SKIP][213] ([Intel XE#3432])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][214] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][215] ([Intel XE#2705] / [Intel XE#4212])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         [SKIP][216] ([Intel XE#4947]) -> [SKIP][217] ([Intel XE#4416] / [Intel XE#455])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_cdclk@plane-scaling.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][218] ([Intel XE#2325]) -> [SKIP][219] ([Intel XE#4950]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_chamelium_color@ctm-green-to-red.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][220] ([Intel XE#2252]) -> [SKIP][221] ([Intel XE#4950]) +7 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][222] ([Intel XE#4950]) -> [SKIP][223] ([Intel XE#2252]) +11 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-adlp:         [SKIP][224] ([Intel XE#4950]) -> [SKIP][225] ([Intel XE#373])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][226] ([Intel XE#2390]) -> [SKIP][227] ([Intel XE#4950])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][228] ([Intel XE#1178]) -> [SKIP][229] ([Intel XE#4950])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_content_protection@legacy.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][230] ([Intel XE#1178]) -> [SKIP][231] ([Intel XE#2341])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-2/igt@kms_content_protection@lic-type-0.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-adlp:         [SKIP][232] ([Intel XE#4950]) -> [SKIP][233] ([Intel XE#455])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_content_protection@srm.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][234] ([Intel XE#4950]) -> [SKIP][235] ([Intel XE#2320]) +6 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][236] ([Intel XE#4950]) -> [SKIP][237] ([Intel XE#2321]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-adlp:         [SKIP][238] ([Intel XE#4950]) -> [SKIP][239] ([Intel XE#308])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_cursor_crc@cursor-random-512x170.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][240] ([Intel XE#2320]) -> [SKIP][241] ([Intel XE#4950]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][242] ([Intel XE#2321]) -> [SKIP][243] ([Intel XE#4950])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][244] ([Intel XE#2291]) -> [DMESG-WARN][245] ([Intel XE#5354])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][246] ([Intel XE#4950]) -> [SKIP][247] ([Intel XE#2291]) +6 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][248] ([Intel XE#2286]) -> [SKIP][249] ([Intel XE#4950])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][250] ([Intel XE#4947]) -> [SKIP][251] ([Intel XE#4354])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][252] ([Intel XE#4354]) -> [SKIP][253] ([Intel XE#4947])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][254] ([Intel XE#4947]) -> [SKIP][255] ([Intel XE#4331])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][256] ([Intel XE#2244]) -> [SKIP][257] ([Intel XE#4947])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-adlp:         [SKIP][258] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][259] ([Intel XE#455])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_dsc@dsc-with-bpc-formats.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][260] ([Intel XE#4947]) -> [SKIP][261] ([Intel XE#2244])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][262] ([Intel XE#4945]) -> [SKIP][263] ([Intel XE#4422])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][264] ([Intel XE#4422]) -> [SKIP][265] ([Intel XE#4945])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][266] ([Intel XE#776]) -> [SKIP][267] ([Intel XE#4947])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_fbcon_fbt@psr.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         [SKIP][268] ([Intel XE#4947]) -> [SKIP][269] ([Intel XE#776])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_fbcon_fbt@psr-suspend.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][270] ([Intel XE#2372]) -> [SKIP][271] ([Intel XE#4950])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_feature_discovery@chamelium.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][272] ([Intel XE#1138]) -> [SKIP][273] ([Intel XE#4950])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_feature_discovery@display-4x.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][274] ([Intel XE#2375]) -> [SKIP][275] ([Intel XE#4950])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-adlp:         [SKIP][276] ([Intel XE#4950]) -> [SKIP][277] ([Intel XE#310])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][278] ([Intel XE#4950]) -> [SKIP][279] ([Intel XE#2316]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_flip@2x-plain-flip.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][280] ([Intel XE#301]) -> [FAIL][281] ([Intel XE#301] / [Intel XE#3149])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][282] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][283] ([Intel XE#301])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][284] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][285] ([Intel XE#4947]) +6 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][286] ([Intel XE#4947]) -> [SKIP][287] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][288] ([Intel XE#4947]) -> [SKIP][289] ([Intel XE#2380])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][290] ([Intel XE#4947]) -> [SKIP][291] ([Intel XE#651]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][292] ([Intel XE#2311]) -> [SKIP][293] ([Intel XE#4947]) +28 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][294] ([Intel XE#2312]) -> [SKIP][295] ([Intel XE#2311]) +12 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][296] ([Intel XE#4947]) -> [SKIP][297] ([Intel XE#2312]) +28 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][298] ([Intel XE#2311]) -> [SKIP][299] ([Intel XE#2312]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][300] ([Intel XE#4947]) -> [SKIP][301] ([Intel XE#2311]) +17 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][302] ([Intel XE#4947]) -> [SKIP][303] ([Intel XE#5390]) +9 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][304] ([Intel XE#2312]) -> [SKIP][305] ([Intel XE#5390]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][306] ([Intel XE#5390]) -> [SKIP][307] ([Intel XE#2312]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][308] ([Intel XE#5390]) -> [SKIP][309] ([Intel XE#4947]) +12 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][310] ([Intel XE#2352]) -> [SKIP][311] ([Intel XE#4947])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][312] ([Intel XE#4947]) -> [SKIP][313] ([Intel XE#2313]) +15 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [SKIP][314] ([Intel XE#4947]) -> [SKIP][315] ([Intel XE#653]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][316] ([Intel XE#2313]) -> [SKIP][317] ([Intel XE#2312]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][318] ([Intel XE#2312]) -> [SKIP][319] ([Intel XE#2313]) +9 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-adlp:         [SKIP][320] ([Intel XE#4947]) -> [SKIP][321] ([Intel XE#656]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          [SKIP][322] ([Intel XE#2313]) -> [SKIP][323] ([Intel XE#4947]) +28 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][324] ([Intel XE#4947]) -> [SKIP][325] ([Intel XE#2350])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][326] ([Intel XE#4950]) -> [SKIP][327] ([Intel XE#3374] / [Intel XE#3544])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][328] ([Intel XE#4947]) -> [SKIP][329] ([Intel XE#3012])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-adlp:         [SKIP][330] ([Intel XE#4947]) -> [SKIP][331] ([Intel XE#2925])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][332] ([Intel XE#4947]) -> [SKIP][333] ([Intel XE#2927])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][334] ([Intel XE#4090]) -> [SKIP][335] ([Intel XE#4947])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][336] ([Intel XE#4950]) -> [SKIP][337] ([Intel XE#2486])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-adlp:         [SKIP][338] ([Intel XE#4950]) -> [SKIP][339] ([Intel XE#4596])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_plane_multiple@2x-tiling-4.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][340] ([Intel XE#4950]) -> [SKIP][341] ([Intel XE#4596])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][342] ([Intel XE#4596]) -> [SKIP][343] ([Intel XE#5021])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][344] ([Intel XE#4950]) -> [SKIP][345] ([Intel XE#5020])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][346] ([Intel XE#4950]) -> [SKIP][347] ([Intel XE#2763])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][348] ([Intel XE#2763]) -> [SKIP][349] ([Intel XE#4950])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][350] ([Intel XE#2938]) -> [SKIP][351] ([Intel XE#4947])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][352] ([Intel XE#2391]) -> [SKIP][353] ([Intel XE#4947])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][354] ([Intel XE#4947]) -> [SKIP][355] ([Intel XE#2392]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][356] ([Intel XE#3309]) -> [SKIP][357] ([Intel XE#4947])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][358] ([Intel XE#4947]) -> [SKIP][359] ([Intel XE#2505])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][360] ([Intel XE#4947]) -> [SKIP][361] ([Intel XE#2499])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][362] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][363] ([Intel XE#4962]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-adlp:         [SKIP][364] ([Intel XE#4947]) -> [SKIP][365] ([Intel XE#1489]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][366] ([Intel XE#1489]) -> [SKIP][367] ([Intel XE#4947]) +8 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][368] ([Intel XE#4947]) -> [SKIP][369] ([Intel XE#1489]) +7 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][370] ([Intel XE#4947]) -> [SKIP][371] ([Intel XE#2387])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][372] ([Intel XE#2387]) -> [SKIP][373] ([Intel XE#4947])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-adlp:         [SKIP][374] ([Intel XE#4947]) -> [SKIP][375] ([Intel XE#2850] / [Intel XE#929])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          [SKIP][376] ([Intel XE#4947]) -> [SKIP][377] ([Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-render.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          [SKIP][378] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][379] ([Intel XE#4947]) +13 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_psr@pr-suspend.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-adlp:         [SKIP][380] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][381] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_psr@psr2-primary-blt.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][382] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][383] ([Intel XE#4950]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][384] ([Intel XE#4950]) -> [SKIP][385] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         [SKIP][386] ([Intel XE#4950]) -> [SKIP][387] ([Intel XE#1127])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][388] ([Intel XE#2413]) -> [SKIP][389] ([Intel XE#4950])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][390] ([Intel XE#1435]) -> [SKIP][391] ([Intel XE#4950]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][392] ([Intel XE#2426]) -> [SKIP][393] ([Intel XE#4950])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#362]) -> [SKIP][395] ([Intel XE#1500])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][396] ([Intel XE#4950]) -> [SKIP][397] ([Intel XE#2450])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         [SKIP][398] ([Intel XE#4950]) -> [SKIP][399] ([Intel XE#2168])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_vrr@lobf.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][400] ([Intel XE#1499]) -> [SKIP][401] ([Intel XE#4950])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][402] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][403] ([Intel XE#4950])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][404] ([Intel XE#4837]) -> [SKIP][405] ([Intel XE#4945]) +10 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         [SKIP][406] ([Intel XE#4945]) -> [SKIP][407] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][408] ([Intel XE#4945]) -> [SKIP][409] ([Intel XE#4837]) +12 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         [SKIP][410] ([Intel XE#4945]) -> [SKIP][411] ([Intel XE#5563] / [Intel XE#688])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-adlp:         [SKIP][412] ([Intel XE#4945]) -> [SKIP][413] ([Intel XE#1392] / [Intel XE#5575]) +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][414] ([Intel XE#2322]) -> [SKIP][415] ([Intel XE#4945]) +6 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][416] ([Intel XE#4945]) -> [SKIP][417] ([Intel XE#2322]) +8 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-adlp:         [SKIP][418] ([Intel XE#4945]) -> [SKIP][419] ([Intel XE#288] / [Intel XE#5561]) +3 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [DMESG-WARN][420] ([Intel XE#3876]) -> [SKIP][421] ([Intel XE#4945])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][422] ([Intel XE#4945]) -> [SKIP][423] ([Intel XE#4943]) +19 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-malloc:
    - shard-adlp:         [SKIP][424] ([Intel XE#4945]) -> [SKIP][425] ([Intel XE#4915] / [Intel XE#5560]) +49 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_exec_system_allocator@many-malloc.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_exec_system_allocator@many-malloc.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][426] ([Intel XE#4943]) -> [SKIP][427] ([Intel XE#4945]) +17 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-adlp:         [SKIP][428] ([Intel XE#4945]) -> [SKIP][429] ([Intel XE#5100])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_mmap@pci-membarrier-parallel.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][430] ([Intel XE#586]) -> [SKIP][431] ([Intel XE#4945])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_mmap@small-bar.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_mmap@small-bar.html

  * igt@xe_oa@buffer-size:
    - shard-adlp:         [SKIP][432] ([Intel XE#4945]) -> [SKIP][433] ([Intel XE#5103])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_oa@buffer-size.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_oa@buffer-size.html

  * igt@xe_oa@short-reads:
    - shard-adlp:         [SKIP][434] ([Intel XE#4945]) -> [SKIP][435] ([Intel XE#3573])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_oa@short-reads.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_oa@short-reads.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         [SKIP][436] ([Intel XE#4945]) -> [SKIP][437] ([Intel XE#2284] / [Intel XE#366])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_pm@d3cold-mmap-vram.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][438] ([Intel XE#4945]) -> [SKIP][439] ([Intel XE#2284]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][440] ([Intel XE#579]) -> [SKIP][441] ([Intel XE#4945])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][442] ([Intel XE#4945]) -> [SKIP][443] ([Intel XE#4650])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          [SKIP][444] ([Intel XE#4945]) -> [SKIP][445] ([Intel XE#4733]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][446] ([Intel XE#4733]) -> [SKIP][447] ([Intel XE#4945]) +3 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         [SKIP][448] ([Intel XE#4945]) -> [SKIP][449] ([Intel XE#944])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_query@multigpu-query-config.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][450] ([Intel XE#4945]) -> [SKIP][451] ([Intel XE#944]) +2 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][452] ([Intel XE#944]) -> [SKIP][453] ([Intel XE#4945])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          [SKIP][454] ([Intel XE#4945]) -> [SKIP][455] ([Intel XE#4130])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [SKIP][456] ([Intel XE#4351]) -> [SKIP][457] ([Intel XE#4945])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@xe_sriov_scheduling@equal-throughput.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6 -> xe-pw-152479v1

  IGT_8483: 8483
  xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6: 32387573a2627cb341b0f28872229d8f96f92fc6
  xe-pw-152479v1: 152479v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/index.html

--===============8394329491432809759==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix coverity issue, cast_overflow</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152479/">https://patchwork.freedesktop.org/series/152479/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152479v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152479v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3500-32387573a2627cb341b0f28872229d8f9=
6f92fc6_FULL -&gt; xe-pw-152479v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152479v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@core_get=
version@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@core_getversion@basic.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672"=
>Intel XE#4672</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@core_hot=
unplug@unplug-rescan.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@core_hotunplug@unplug-re=
scan.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@fbdev@un=
aligned-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@fbdev@unaligned-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134"=
>Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_addf=
b_basic@bad-pitch-999.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_addfb_basic@bad-pit=
ch-999.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4950">Intel XE#4950</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-a=
dlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_bw@connected-linear-til=
ing-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-=
tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_=
ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +=
14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-=
1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-46=
4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705=
">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-463/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">In=
tel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-mtl-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_cdclk@plane-scaling@pipe=
-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4416">Intel XE#4416</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_cdclk@plane-scaling@pipe=
-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_chamelium_color@degamma=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-stor=
m-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_content_protection@atom=
ic@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_feature_discovery@displ=
ay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE=
#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-lnl-3/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-lnl-7/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-3/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +5 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32=
bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Inte=
l XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_joiner@basic-force-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_plane_multiple@2x-tilin=
g-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_plane_scaling@planes-down=
scale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_pm_r=
pm@drm-resources-equal.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_pm_rpm@drm-resourc=
es-equal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@kms_psr2_sf@pr-overlay-plan=
e-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrg=
b8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_psr@fbc-psr-primary-blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mod=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">=
Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@xe_compute_preempt@compute-=
threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1=
280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_eudebug@basic-vm-access-pa=
rameters-userptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_eudebug_online@preempt-b=
reakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_exec_=
basic@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_exec_basic=
@many-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +414 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-rebind.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@=
xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once=
-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-434/igt@xe_exe=
c_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-463/igt@xe_exec_reset@par=
allel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_exec_system_allocator@once=
-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-new-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@xe_exec_system_allocator@th=
reads-many-stride-new-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +122 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-152479v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@xe_live_=
ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_liv=
e_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@xe_pm@d3cold-i2c.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">=
Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_pm@s=
2idle-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152479v1/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4173">Intel XE#4173</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-466/igt@xe_pmu@all-fn-engine-activi=
ty-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_pxp@display-pxp-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
733">Intel XE#4733</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_query@multigpu-query-oa-=
units.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw=
-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152479v1/shard-dg2-432/igt@xe_sriov_scheduling@nonpree=
mpt-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@core_get=
version@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@core_getversi=
on@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@core_ho=
tunplug@hotunbind-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@core_=
hotunplug@hotunbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@core_set=
master@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@cor=
e_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@fbdev@un=
aligned-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@fbdev@unaligned-re=
ad.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@intel_hw=
mon@hwmon-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5177">Intel XE#5177</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@intel_hwmon@hwmo=
n-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-2/igt@kms_add=
fb_basic@size-max.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adl=
p-6/igt@kms_addfb_basic@size-max.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-cursor:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_ato=
mic_interruptible@legacy-cursor.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/i=
gt@kms_atomic_interruptible@legacy-cursor.html">PASS</a> +10 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_big_=
fb@x-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_big_fb@x-t=
iled-addfb.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">I=
ntel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152479v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-ro=
tate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/=
shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152479v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-466/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/=
shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2=
-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2-4=
66/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-2/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-3/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_flip=
@flip-vs-blocking-wf-vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-3/i=
gt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-lnl-7/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-8/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-9=
/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-=
1/igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-3/=
igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> +5 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_plan=
e_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@km=
s_plane_scaling@intel-max-src-size.html">PASS</a> +72 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_pm_r=
pm@legacy-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_pm_rp=
m@legacy-planes-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-3/igt@kms_set=
mode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-4/igt@kms_setmode@basic.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#13=
92</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2479v1/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userp=
tr-rebind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-1/igt@xe_exec=
_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-3/i=
gt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-1/igt@xe_exec=
_threads@threads-bal-mixed-fd-basic.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard=
-adlp-3/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-1/igt@xe_exec=
_threads@threads-cm-fd-basic.html">FAIL</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-3/igt@xe_exec_threads=
@threads-cm-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-463/igt@xe_exe=
c_threads@threads-hang-userptr-rebind.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/sha=
rd-dg2-463/igt@xe_exec_threads@threads-hang-userptr-rebind.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@xe_gt_fr=
eq@freq_suspend.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-1/igt@xe_gt_freq@freq_suspend=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_spin_=
batch@spin-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_spin_batch@sp=
in-all.html">PASS</a> +417 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-either-side-partial:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_vm@m=
unmap-style-unbind-either-side-partial.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-ad=
lp-8/igt@xe_vm@munmap-style-unbind-either-side-partial.html">PASS</a> +22 o=
ther tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel =
XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152479v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_=
big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_big=
_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard=
-adlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5=
/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_big_=
fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@k=
ms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_big=
_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152479v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2479v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shar=
d-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">In=
tel XE#4947</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/sh=
ard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152479v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_bw@=
connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/s=
hard-adlp-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
91">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_bw@l=
inear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/=
igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_bw@l=
inear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/ig=
t@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_ccs@=
bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5=
/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a=
>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_ccs@=
bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/ig=
t@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_ccs@=
crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-b=
mg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE=
#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_ccs=
@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/i=
gt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bm=
g-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/sha=
rd-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">=
Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-dg2=
-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_cdc=
lk@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_cdclk@pla=
ne-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4416">Intel XE#4416</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_cham=
elium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@km=
s_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_cham=
elium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/=
igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
 +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_cham=
elium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/=
igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)=
 +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_cha=
melium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adl=
p-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/ig=
t@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-2/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_con=
tent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_conten=
t_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_curs=
or_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/ig=
t@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_cur=
sor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@=
kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_curs=
or_crc@cursor-sliding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms=
_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_curs=
or_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@k=
ms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-b=
mg-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">In=
tel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel =
XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152479v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_d=
p_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_dp_li=
nk_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms=
_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_dsc=
@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-=
8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_dsc@=
dsc-with-output-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_dsc=
@dsc-with-output-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v=
1/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1=
/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_fbco=
n_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_fbcon_fbt@psr.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_fbc=
on_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_fbcon_f=
bt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_feat=
ure_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_fli=
p@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@km=
s_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_flip=
@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_flip@2x-plai=
n-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-lnl-7/igt@kms_flip@=
flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
79v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">I=
ntel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152479v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32=
bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">I=
ntel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152479v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
79v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2=
311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52479v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb=
-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/sh=
ard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
79v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152479v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-=
bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
79v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5390">Intel XE#5390</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152479v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52479v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v=
1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4947">Intel XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/i=
gt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
79v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2479v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52479v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52479v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
2479v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/sha=
rd-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">=
Intel XE#4947</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6=
/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_joi=
ner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-ad=
lp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2=
925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_join=
er@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/ig=
t@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard=
-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Inte=
l XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_pla=
ne_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_pl=
ane_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_p=
lane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-3/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg=
-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#276=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bm=
g-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4=
950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@k=
ms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_pm_dc@dc5-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2392">Intel XE#2392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@kms_pm_dc@deep-pkgc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2505">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard=
-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_psr=
2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp=
-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_psr2=
_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-b=
mg-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52479v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_psr2_su@=
page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_psr2_su@=
page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_psr=
@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@km=
s_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_psr@=
fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_psr@=
fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_psr@=
pr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_ps=
r@pr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_psr=
@psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/i=
gt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-b=
mg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_rota=
tion_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@k=
ms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_rot=
ation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-ad=
lp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1=
127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_scal=
ing_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@k=
ms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@kms_setm=
ode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms=
_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/sha=
rd-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500=
">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@kms_vrr=
@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@kms_vrr@lobf.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">I=
ntel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@sriov_ba=
sic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE=
#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152479v1/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-al=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@xe_eudeb=
ug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5=
/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_eude=
bug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard=
-adlp-8/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Inte=
l XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5565">Intel XE#5565</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_eudeb=
ug_online@stopped-thread.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_eud=
ebug_online@stopped-thread.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +12 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_evic=
t_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
79v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-sa=
mefd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5563">Intel XE#5563</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">I=
ntel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152479v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-ma=
ny-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/sha=
rd-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">=
Intel XE#4945</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_exec_=
basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/ig=
t@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +8 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_exec=
_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/=
shard-adlp-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
288">Intel XE#288</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5561">Intel XE#5561</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_exec_=
reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@x=
e_exec_reset@parallel-gt-reset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_exec_=
system_allocator@many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1524=
79v1/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nom=
emset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4943">Intel XE#4943</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_exec=
_system_allocator@many-malloc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@=
xe_exec_system_allocator@many-malloc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560=
</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">=
Intel XE#4943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-152479v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-v=
m-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +17 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_mmap=
@pci-membarrier-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_mm=
ap@pci-membarrier-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/586">Intel XE#586</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_mmap@small-bar.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_oa@b=
uffer-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_oa@buffer-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5103">Intel XE#5103</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_oa@s=
hort-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_oa@short-reads.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_pm@d=
3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_pm@d3cold-m=
map-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_pm@vr=
am-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe_pm@vram-d3=
cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_pxp@p=
xp-stale-queue-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-6/igt@xe_=
pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@xe_pxp@p=
xp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bm=
g-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4=
945</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-adlp-4/igt@xe_quer=
y@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-adlp-8/igt@xe_que=
ry@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_query=
@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-4/igt@xe_que=
ry@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-1/igt@xe_query=
@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/ig=
t@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-5/igt@xe_sriov=
_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel X=
E#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152479v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovisio=
n-increase-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6/shard-bmg-4/igt@xe_sriov=
_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152479v1/shard-bmg-5/igt@xe=
_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6 -&gt; xe-pw-152=
479v1</li>
</ul>
<p>IGT_8483: 8483<br />
  xe-3500-32387573a2627cb341b0f28872229d8f96f92fc6: 32387573a2627cb341b0f28=
872229d8f96f92fc6<br />
  xe-pw-152479v1: 152479v1</p>

</body>
</html>

--===============8394329491432809759==--
