Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AE3C624D3
	for <intel-xe@archiver.kernel.org>; Sat,  5 Sep 2026 15:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FC810E65F;
	Sat,  5 Sep 2026 15:15:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983DE10E652;
 Sat,  5 Sep 2026 15:15:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4710502999692831782=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/gpusvm=3A_share_one_HM?=
 =?utf-8?q?M_fault_and_keep_single_mappings_inline_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Honglei Huang" <honghuan@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 05 Sep 2026 15:15:16 -0000
Message-ID: <178862131660.126685.13185871810648551102@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260905133142.3628027-1-honghuan@amd.com>
In-Reply-To: <20260905133142.3628027-1-honghuan@amd.com>
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

--===============4710502999692831782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpusvm: share one HMM fault and keep single mappings inline (rev2)
URL   : https://patchwork.freedesktop.org/series/173405/
State : success

== Summary ==

CI Bug Log - changes from xe-5694-313da1cc22491f07075c7ae36372343aa235d11e_FULL -> xe-pw-173405v2_FULL
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

  Here are the changes found in xe-pw-173405v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1125] / [Intel XE#7312])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@intel_hwmon@hwmon-read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2370])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407]) +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#3658] / [Intel XE#7360])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#7059] / [Intel XE#7085])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-lnl:          [PASS][6] -> [SKIP][7] ([Intel XE#9125]) +14 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1428] / [Intel XE#7387])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +8 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7679]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#367])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#8365])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2669] / [Intel XE#7389]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#7008])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2252])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#7358])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#373]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#6507])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_color@gamma:
    - shard-lnl:          [PASS][26] -> [SKIP][27] ([Intel XE#3297])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_color@gamma.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_color@gamma.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#6974])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2390] / [Intel XE#6974])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7642]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2320])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1424]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#309] / [Intel XE#7343]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#7809])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1508])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4354] / [Intel XE#5882])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#9009])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#4331] / [Intel XE#7227])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#8265])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#8265])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#4422] / [Intel XE#7442])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#703] / [Intel XE#7448])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1137] / [Intel XE#2375])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1421]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#301])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#301] / [Intel XE#3149])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@nonexisting-fb:
    - shard-lnl:          [PASS][50] -> [SKIP][51] ([Intel XE#2482])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_flip@nonexisting-fb.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_flip@nonexisting-fb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-lnl:          [PASS][54] -> [SKIP][55] ([Intel XE#1745] / [Intel XE#9144])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7178] / [Intel XE#7349])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#352])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4141])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#656] / [Intel XE#7905]) +29 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#6312]) +9 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#6312] / [Intel XE#651]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2311]) +11 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#7905]) +32 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7061])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [PASS][66] -> [SKIP][67] ([Intel XE#7779])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2313]) +13 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [PASS][69] -> [SKIP][70] ([Intel XE#2548] / [Intel XE#7779]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7865]) +22 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#7061]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1470])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#1503])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1503])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-lnl:          [PASS][78] -> [SKIP][79] ([Intel XE#2568])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_invalid_mode@bad-vtotal.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#6900] / [Intel XE#7362])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#8348])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#7283]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-lnl:          [PASS][84] -> [SKIP][85] ([Intel XE#9128])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#599])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#4596] / [Intel XE#5854])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#5020] / [Intel XE#7348])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
    - shard-lnl:          [PASS][89] -> [SKIP][90] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c:
    - shard-lnl:          [PASS][91] -> [SKIP][92] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#8396]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1131])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-lnl:          [PASS][97] -> [FAIL][98] ([Intel XE#8399])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-lnl:          [PASS][99] -> [SKIP][100] ([Intel XE#9129])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_properties@plane-properties-legacy.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#4608])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#4608] / [Intel XE#7304])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#1489]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1128] / [Intel XE#7413])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1406])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-lnl:          [PASS][107] -> [SKIP][108] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1406] / [Intel XE#7345]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2234] / [Intel XE#2850])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#362] / [Intel XE#5848])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#1499]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1499])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#7638])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@xe_evict@evict-small-external-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#8370])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_evict@evict-small-external-multi-queue.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#6540] / [Intel XE#688]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#7482]) +13 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1392]) +5 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2322] / [Intel XE#7372])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#8374])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#8374]) +11 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@many-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#8364]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-basic.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#8364]) +23 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#8369]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#9096]) +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-3/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
    - shard-bmg:          [PASS][129] -> [FAIL][130] ([Intel XE#9096]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-10/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#8378]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-rebind-err:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#8378]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-rebind-err.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#7954])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_madvise@atomic-device:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#7980])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_madvise@atomic-device.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156]) -> ([PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [SKIP][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178]) ([Intel XE#378] / [Intel XE#7405])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-4/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-4/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-4/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-4/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-4/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-3/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-3/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-4/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-3/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#6964]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#7793])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#7793]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#7590] / [Intel XE#7772])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#7590])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#1948])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7456])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#7599])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#944]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#944])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_admin@default-sched-attributes-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#7174])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_sriov_admin@default-sched-attributes-vfs-disabled.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][192] ([Intel XE#8963])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][193] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_color@degamma:
    - shard-lnl:          [SKIP][195] ([Intel XE#3297]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_color@degamma.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_color@degamma.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [ABORT][197] ([Intel XE#9154]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-panning:
    - shard-lnl:          [SKIP][199] ([Intel XE#2482]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_flip@flip-vs-panning.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_flip@flip-vs-panning.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][201] ([Intel XE#7779]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          [SKIP][203] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][204] +5 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@bpc-switch:
    - shard-lnl:          [SKIP][205] ([Intel XE#9125]) -> [PASS][206] +11 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_hdr@bpc-switch.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_hdr@bpc-switch.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-lnl:          [SKIP][207] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-lnl:          [SKIP][209] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-lnl:          [SKIP][211] ([Intel XE#4886]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_pm_rpm@legacy-planes-dpms.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][213] ([Intel XE#1489]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr2-suspend:
    - shard-lnl:          [SKIP][215] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr@psr2-suspend.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr@psr2-suspend.html

  * igt@xe_configfs@gt-types-allowed:
    - shard-bmg:          [ABORT][217] ([Intel XE#8007]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-4/igt@xe_configfs@gt-types-allowed.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_configfs@gt-types-allowed.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][219] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:
    - shard-bmg:          [INCOMPLETE][221] ([Intel XE#9041]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-1/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-7/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][223] ([Intel XE#9125]) -> [SKIP][224] ([Intel XE#3658] / [Intel XE#7360])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          [SKIP][225] ([Intel XE#9125]) -> [SKIP][226] ([Intel XE#1407])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          [SKIP][227] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][228] ([Intel XE#9125])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][229] ([Intel XE#9125]) -> [SKIP][230] ([Intel XE#1124]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][231] ([Intel XE#1124]) -> [SKIP][232] ([Intel XE#9125]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][233] ([Intel XE#7679]) -> [SKIP][234] ([Intel XE#9125])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          [SKIP][235] ([Intel XE#2887]) -> [SKIP][236] ([Intel XE#9125]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][237] ([Intel XE#9125]) -> [SKIP][238] ([Intel XE#2669] / [Intel XE#7389])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][239] ([Intel XE#9125]) -> [SKIP][240] ([Intel XE#3432])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          [SKIP][241] ([Intel XE#9125]) -> [SKIP][242] ([Intel XE#2887]) +2 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-lnl:          [SKIP][243] ([Intel XE#9125]) -> [SKIP][244] ([Intel XE#307] / [Intel XE#6974])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          [SKIP][245] ([Intel XE#307] / [Intel XE#6974]) -> [SKIP][246] ([Intel XE#9125])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_content_protection@dp-mst-type-0.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          [SKIP][247] ([Intel XE#9125]) -> [SKIP][248] ([Intel XE#2321] / [Intel XE#7355])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x170.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          [SKIP][249] ([Intel XE#1424]) -> [SKIP][250] ([Intel XE#9125])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          [SKIP][251] ([Intel XE#9125]) -> [SKIP][252] ([Intel XE#1424]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          [SKIP][253] ([Intel XE#9125]) -> [SKIP][254] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          [SKIP][255] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][256] ([Intel XE#9125])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-mst.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-lnl:          [SKIP][257] ([Intel XE#8265]) -> [SKIP][258] ([Intel XE#9125])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_dsc@dsc-fractional-bpp.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          [SKIP][259] ([Intel XE#9125]) -> [SKIP][260] ([Intel XE#8265])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_dsc@dsc-with-bpc-formats.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][261] ([Intel XE#301]) -> [FAIL][262] ([Intel XE#301] / [Intel XE#3149])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][263] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) -> [SKIP][264] ([Intel XE#1745] / [Intel XE#9144])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][265] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][266] ([Intel XE#2548] / [Intel XE#7779]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          [SKIP][267] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][268] ([Intel XE#2548] / [Intel XE#7779]) +8 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][269] ([Intel XE#7779]) -> [SKIP][270] ([Intel XE#6312]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          [SKIP][271] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][272] ([Intel XE#1469] / [Intel XE#7399])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][273] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][274] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][275] ([Intel XE#7779]) -> [SKIP][276] ([Intel XE#7061] / [Intel XE#7356])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:
    - shard-lnl:          [SKIP][277] ([Intel XE#6312]) -> [SKIP][278] ([Intel XE#7779]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][279] ([Intel XE#7779]) -> [SKIP][280] ([Intel XE#7061]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][281] ([Intel XE#7061]) -> [SKIP][282] ([Intel XE#7779])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          [SKIP][283] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][284] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          [SKIP][285] ([Intel XE#7779]) -> [SKIP][286] ([Intel XE#7865]) +5 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-lnl:          [SKIP][287] ([Intel XE#7865]) -> [SKIP][288] ([Intel XE#7779]) +6 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][289] ([Intel XE#7779]) -> [SKIP][290] ([Intel XE#7905]) +10 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][291] ([Intel XE#7905]) -> [SKIP][292] ([Intel XE#7779]) +11 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][293] ([Intel XE#5020] / [Intel XE#7348]) -> [SKIP][294] ([Intel XE#9125])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-lnl:          [SKIP][295] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][296] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][297] ([Intel XE#1489]) -> [SKIP][298] ([Intel XE#2893] / [Intel XE#7304])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][299] ([Intel XE#1489]) -> [SKIP][300] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][301] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][302] ([Intel XE#1489]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-lnl:          [SKIP][303] ([Intel XE#1406]) -> [SKIP][304] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_psr@fbc-pr-no-drrs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          [SKIP][305] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][306] ([Intel XE#1406]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr@pr-no-drrs.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          [SKIP][307] ([Intel XE#9125]) -> [SKIP][308] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][309] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][310] ([Intel XE#1729] / [Intel XE#7424])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][311] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][312] ([Intel XE#2509] / [Intel XE#7437])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][313] ([Intel XE#1499]) -> [SKIP][314] ([Intel XE#9125])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-vrr.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [DMESG-WARN][315] ([Intel XE#9130]) -> [ABORT][316] ([Intel XE#9131] / [Intel XE#9145])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-5/igt@xe_exec_reset@gt-reset-fault-injection.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-7/igt@xe_exec_reset@gt-reset-fault-injection.html
    - shard-lnl:          [ABORT][317] ([Intel XE#9140] / [Intel XE#9145]) -> [DMESG-WARN][318] ([Intel XE#9130])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_exec_reset@gt-reset-fault-injection.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@xe_exec_reset@gt-reset-fault-injection.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
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
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
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
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9041
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131
  [Intel XE#9140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#9154]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9154
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5694-313da1cc22491f07075c7ae36372343aa235d11e -> xe-pw-173405v2

  IGT_9084: 9084
  xe-5694-313da1cc22491f07075c7ae36372343aa235d11e: 313da1cc22491f07075c7ae36372343aa235d11e
  xe-pw-173405v2: 173405v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/index.html

--===============4710502999692831782==
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
<tr><td><b>Series:</b></td><td>drm/gpusvm: share one HMM fault and keep sin=
gle mappings inline (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/173405/">https://patchwork.freedesktop.org/series/173405/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-173405v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173405v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5694-313da1cc22491f07075c7ae36372343aa=
235d11e_FULL -&gt; xe-pw-173405v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173405v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
25">Intel XE#1125</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7312">Intel XE#7312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_big_=
fb@x-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_big_fb@x-tiled-=
32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9125">Intel XE#9125</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1428">Intel XE#1428</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_bw@linear-tiling-2-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@kms_bw@linear-tiling-4-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7008">Intel XE#7008</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@kms_chamelium_audio@dp-audio-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_chamelium_color_pipeline@=
plane-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_chamelium_color_pipeline@=
plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_chamelium_edid@hdmi-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-wi=
th-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_colo=
r@gamma.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_color@gamma.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#32=
97</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_content_protection@dp-mst=
-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_content_protection@uevent=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7642">Intel XE#7642</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding=
-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-6/igt@k=
ms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/703">Intel XE#703</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1137">Intel XE#1137</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms-off-=
vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_flip=
@nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_flip@nonexisting-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
482">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">In=
tel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-l=
nl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel =
XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +29 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +=
9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +32 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbch=
dr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard=
-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-suspend.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_frontbuff=
er_tracking@fbcpsr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7865">Intel XE#7865</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcp=
srhdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-173405v2/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_hdr@static-toggle-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_inva=
lid_mode@bad-vtotal.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_invalid_mode@bad-vtot=
al.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_mst@mst-suspend-read-crc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_plane@pixel-format-y-tile=
d-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_plan=
e@plane-panning-bottom-right.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_plane@plane-=
panning-bottom-right.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-=
a:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_plan=
e_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2=
/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-fo=
rmat@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_plan=
e_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2=
/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-fo=
rmat@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#91=
25</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@psr=
2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_pm_d=
c@dc5-dpms-suspend-resume.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-=
suspend-resume.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_prop=
erties@plane-properties-legacy.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_properties=
@plane-properties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9129">Intel XE#9129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#73=
04</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@kms_psr@fbc-pr-cursor-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_psr@=
fbc-psr-cursor-plane-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_psr@fbc-psr-cu=
rsor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_psr@fbc-psr2-no-drrs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7345">Intel XE#7345</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_psr@fbc-psr2-no-drrs@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_psr@psr2-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234=
">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_vrr@lobf@pipe-a-edp-1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7638">Intel XE#7638</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_evict@evict-small-external=
-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit=
-standalone-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@xe_exec_balancer@twice-cm-vir=
tual-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#=
1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_exec_multi_queue@many-queu=
es-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +23 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_exec_reset@multi-queue-gt-=
reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-3/ig=
t@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9=
096</a>) +1 other test fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-2/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-10/i=
gt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#=
9096</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind-err:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_exec_threads@threads-multi=
-queue-rebind-err.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_gpgpu_fill@offset-4x4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-device:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_madvise@atomic-device.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@xe_mmap@pci-membarrier-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7322">Intel XE#7322</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235=
d11e/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343a=
a235d11e/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372=
343aa235d11e/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae3=
6372343aa235d11e/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c=
7ae36372343aa235d11e/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07=
075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc2249=
1f07075c7ae36372343aa235d11e/shard-lnl-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc=
22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313d=
a1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-=
313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe=
_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17340=
5v2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173405v2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17340=
5v2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173405v2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17340=
5v2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173405v2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17340=
5v2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17340=
5v2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#740=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@xe_multigpu_svm@mgpu-pagefaul=
t-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_page_reclaim@pat-index-xd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@xe_page_reclaim@prl-invalidat=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@xe_pat@l2-flush-opt-svm-pat-r=
estrict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7772">Intel XE#7772</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_pat@xa-app-transient-media=
-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_pm@s3-vm-bind-unbind-all.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7329">Intel XE#7329</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7456">Intel XE#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_prefetch_fault@prefetch-fa=
ult-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_query@multigpu-query-gt-li=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@default-sched-attributes-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-1/igt@xe_sriov_admin@default-sched-=
attributes-vfs-disabled.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-10/igt@kms_ccs=
@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE=
#8150</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173405v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_colo=
r@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_color@degamma.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_fbco=
n_fbt@psr-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9154">Intel XE#9154</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-2/igt@kms_fbcon_fb=
t@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_flip=
@flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_flip@flip-=
vs-panning.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE=
#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shr=
fb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#25=
48</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/777=
9">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-spr-indfb-fullscreen.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_hdr@=
bpc-switch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_hdr@bpc-switch.h=
tml">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plan=
e_scaling@plane-upscale-20x20-with-rotation.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel X=
E#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_plane_scaling@pl=
ane-upscale-20x20-with-rotation.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plan=
e_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886"=
>Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_plane_scaling@plane-upscale-20x20-wi=
th-rotation@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_pm_r=
pm@legacy-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_pm_rp=
m@legacy-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2=
_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/sha=
rd-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr@=
psr2-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_ps=
r@psr2-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_configfs@gt-types-allowed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-4/igt@xe_confi=
gfs@gt-types-allowed.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-1/igt@xe_config=
fs@gt-types-allowed.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-7/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1734=
05v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-1/igt@xe_exec_=
reset@gt-stress-reset-mixed-engine-usage.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9041">Intel XE#9041</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/=
shard-bmg-7/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html">PASS=
</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173405v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-1=
80-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_=
fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_b=
ig_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_big_=
fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel =
XE#7085</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173405v2/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-=
hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_=
fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_b=
ig_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel X=
E#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-173405v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0=
-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_bw@c=
onnected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1734=
05v2/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_ccs@=
bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/=
igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@=
crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/i=
gt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel =
XE#7389</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-ln=
l-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3=
432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@=
missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/ig=
t@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/ig=
t@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6=
974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_cont=
ent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-=
lnl-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_curs=
or_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@km=
s_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_curs=
or_crc@cursor-sliding-128x42.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@km=
s_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_curs=
or_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms=
_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE=
#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-l=
nl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_dsc@=
dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_dsc@dsc-=
fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_dsc@ds=
c-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-5/igt@kms_flip@=
flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7385">Intel XE#7385</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">=
Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-173405v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-=
indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">=
Intel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-173405v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn=
-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel =
XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cu=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/sha=
rd-lnl-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399"=
>Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel =
XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7779">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-=
1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/s=
hard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
61">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2=
/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7779">Intel XE#7779</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v=
2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@fbchdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/sh=
ard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779=
">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#254=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779=
">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-prim=
scrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel X=
E#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-c=
ur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/=
igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#=
7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
173405v2/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7905">Intel XE#7905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1734=
05v2/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7779">Intel XE#7779</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_plan=
e_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/=
igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5-unity-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886"=
>Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_plane_sc=
aling@planes-downscale-factor-0-5-unity-scaling.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Int=
el XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#=
1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
173405v2/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-ex=
ceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2=
/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_psr2=
_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304"=
>Intel XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_psr@=
fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_psr@fbc-pr-n=
o-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr@=
pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms_psr@=
pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-7/igt@kms=
_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Inte=
l XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-6/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shar=
d-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">In=
tel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-2/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-173405v2/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-lnl-6/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-5/igt@xe_exec_=
reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/shard-bmg-=
7/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9131">Intel XE#9131</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel=
 XE#9145</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_exec_=
reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9140">Intel XE#9140</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173405v2/s=
hard-lnl-7/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel=
 XE#9130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5694-313da1cc22491f07075c7ae36372343aa235d11e -&gt; xe-pw-173=
405v2</li>
</ul>
<p>IGT_9084: 9084<br />
  xe-5694-313da1cc22491f07075c7ae36372343aa235d11e: 313da1cc22491f07075c7ae=
36372343aa235d11e<br />
  xe-pw-173405v2: 173405v2</p>

</body>
</html>

--===============4710502999692831782==--
