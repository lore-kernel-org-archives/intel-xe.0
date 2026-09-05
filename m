Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72973C624D6
	for <intel-xe@archiver.kernel.org>; Sat,  5 Sep 2026 03:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89D410E1DD;
	Sat,  5 Sep 2026 03:34:13 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9274910E0A3;
 Sat,  5 Sep 2026 03:34:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3885997644030294493=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_CPU_binds_and_ULLS_on_migr?=
 =?utf-8?q?ation_queue_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 05 Sep 2026 03:34:12 -0000
Message-ID: <178857925258.125641.12603793684974150251@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260904211613.3934307-1-matthew.brost@intel.com>
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
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

--===============3885997644030294493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CPU binds and ULLS on migration queue (rev8)
URL   : https://patchwork.freedesktop.org/series/149888/
State : failure

== Summary ==

CI Bug Log - changes from xe-5694-313da1cc22491f07075c7ae36372343aa235d11e_FULL -> xe-pw-149888v8_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149888v8_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149888v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149888v8_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@bind-array-enobufs:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_vm@bind-array-enobufs.html

  
Known issues
------------

  Here are the changes found in xe-pw-149888v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - shard-lnl:          [PASS][2] -> [SKIP][3] ([Intel XE#2134]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@fbdev@info.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@fbdev@info.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1125] / [Intel XE#7312])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#3157])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2370]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#3658] / [Intel XE#7360]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7059] / [Intel XE#7085])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1428] / [Intel XE#7387])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +10 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7679]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#367])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +13 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2669] / [Intel XE#7389]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#7008])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2252])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#306] / [Intel XE#7358]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#7358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7358]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#6507])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_color@ctm-0-75:
    - shard-lnl:          [PASS][27] -> [SKIP][28] ([Intel XE#3297]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_color@ctm-0-75.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_color@ctm-0-75.html

  * igt@kms_color@legacy-gamma:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3297])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_color@legacy-gamma.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-lnl:          [PASS][30] -> [SKIP][31] ([Intel XE#7006])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#6974])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2390] / [Intel XE#6974])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7642]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1424]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2321] / [Intel XE#7355])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2320]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#309] / [Intel XE#7343]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1508])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev@basic:
    - shard-lnl:          [PASS][40] -> [SKIP][41] ([Intel XE#3009])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_dp_aux_dev@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4354] / [Intel XE#5882])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#9009])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#4331] / [Intel XE#7227])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#8265])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#8265]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#4422] / [Intel XE#7442])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4422] / [Intel XE#7442])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-lnl:          [PASS][49] -> [SKIP][50] ([Intel XE#9127])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_fbcon_fbt@fbc.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-lnl:          [PASS][51] -> [SKIP][52] ([Intel XE#8680])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_fbcon_fbt@psr.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#703] / [Intel XE#7448])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1138] / [Intel XE#7344])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1137] / [Intel XE#2375])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-lnl:          [PASS][56] -> [SKIP][57] ([Intel XE#1135])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_feature_discovery@psr1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1421]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2482]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-lnl:          [PASS][60] -> [SKIP][61] ([Intel XE#2482]) +9 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-lnl:          [PASS][64] -> [SKIP][65] ([Intel XE#1745] / [Intel XE#9144]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#7178] / [Intel XE#7351]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#7178] / [Intel XE#7349])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2682])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#352])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7779]) +27 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4141]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#656] / [Intel XE#7905]) +39 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#6312]) +11 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#6312] / [Intel XE#651]) +13 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1469] / [Intel XE#7399])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2311]) +12 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#7905]) +42 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7061])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2313]) +15 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#7865]) +24 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7061]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          [PASS][82] -> [SKIP][83] ([Intel XE#7779]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-lnl:          [PASS][84] -> [SKIP][85] ([Intel XE#2548] / [Intel XE#7779]) +18 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2548] / [Intel XE#7779]) +14 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1470])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#1503])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1503])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-hsync-start:
    - shard-lnl:          [PASS][92] -> [SKIP][93] ([Intel XE#2568]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_invalid_mode@bad-hsync-start.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_invalid_mode@bad-hsync-start.html

  * igt@kms_invalid_mode@bad-vsync-start:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#2568])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_invalid_mode@bad-vsync-start.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#6900] / [Intel XE#7362])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#4298] / [Intel XE#5873])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#8348])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping:
    - shard-lnl:          [PASS][99] -> [SKIP][100] ([Intel XE#7250] / [Intel XE#9128])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#8303]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#7283]) +5 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [PASS][103] -> [SKIP][104] ([Intel XE#9128])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_plane@plane-position-hole.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#599])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#4596] / [Intel XE#5854])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#5020] / [Intel XE#7348])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
    - shard-lnl:          [PASS][108] -> [SKIP][109] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:
    - shard-lnl:          [PASS][111] -> [SKIP][112] ([Intel XE#2763] / [Intel XE#6886]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          [PASS][114] -> [SKIP][115] ([Intel XE#870]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_pm_backlight@basic-brightness.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#8396]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][118] ([Intel XE#8399])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1131])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#8854])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][121] -> [SKIP][122] ([Intel XE#4886]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_pm_rpm@legacy-planes.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-lnl:          [PASS][123] -> [SKIP][124] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_pm_rpm@modeset-lpsp.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-lnl:          [PASS][125] -> [SKIP][126] ([Intel XE#1439] / [Intel XE#836])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2893] / [Intel XE#7304]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#4608]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1489]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#1489]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          [PASS][132] -> [SKIP][133] ([Intel XE#1489]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1128] / [Intel XE#7413]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1406] / [Intel XE#7345]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1406])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [PASS][140] -> [SKIP][141] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-onoff.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1435] / [Intel XE#9142])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#362] / [Intel XE#5848])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#330] / [Intel XE#5857])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          [PASS][146] -> [SKIP][147] ([Intel XE#9125]) +65 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_vblank@query-forked.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_vblank@query-forked.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#1499]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1499])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#7638])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#9125]) +26 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@vm-bind-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#7644])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_ccs@vm-bind-decompress.html

  * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#6540] / [Intel XE#688]) +10 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-small-external-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#8370])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_evict@evict-small-external-multi-queue.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#7482]) +24 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@xe_exec_balancer@no-exec-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2322] / [Intel XE#7372])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1392]) +8 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#8374]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#8374]) +17 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@many-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#8364]) +8 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-basic.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#8364]) +37 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#8369]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-bmg:          [PASS][163] -> [FAIL][164] ([Intel XE#9096])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-10/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#8378]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#8378]) +12 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#7954])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_madvise@atomic-global:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#7980]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_madvise@atomic-global.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190]) -> ([PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [SKIP][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210]) ([Intel XE#378] / [Intel XE#7405])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-4/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-4/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-4/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-5/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-3/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-3/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-5/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-5/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#6964]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#7793])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#7793]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-lnl:          [PASS][214] -> [SKIP][215] ([Intel XE#7590] / [Intel XE#9125])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_pat@display-vs-wb-transient.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-lnl:          NOTRUN -> [FAIL][216] ([Intel XE#7695])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][217] ([Intel XE#7590])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][219] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-lnl:          NOTRUN -> [SKIP][220] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7456])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_prefetch_fault@l2-prefetch-fault:
    - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#8815])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_prefetch_fault@l2-prefetch-fault.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][223] ([Intel XE#7599]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][224] ([Intel XE#4733] / [Intel XE#7417])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][225] ([Intel XE#944]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#944])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_admin@default-sched-attributes-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#7174])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_sriov_admin@default-sched-attributes-vfs-disabled.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][228] ([Intel XE#4130] / [Intel XE#7366])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][229] ([Intel XE#3342])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@equal-throughput-low-priority:
    - shard-lnl:          NOTRUN -> [SKIP][230] ([Intel XE#8339])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_sriov_scheduling@equal-throughput-low-priority.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][231] ([Intel XE#8963])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][232] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [SKIP][234] ([Intel XE#1511] / [Intel XE#3297]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_color@deep-color.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_color@deep-color.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-lnl:          [SKIP][236] ([Intel XE#3297]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_color@legacy-gamma-reset.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_color_pipeline@plane-ctm3x4:
    - shard-lnl:          [SKIP][238] ([Intel XE#7006]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_color_pipeline@plane-ctm3x4.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_color_pipeline@plane-ctm3x4.html

  * igt@kms_cursor_crc@cursor-tearing-position-change:
    - shard-lnl:          [SKIP][240] ([Intel XE#9125]) -> [PASS][241] +39 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_cursor_crc@cursor-tearing-position-change.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_cursor_crc@cursor-tearing-position-change.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-lnl:          [SKIP][242] -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fb_coherency@memset-crc.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-lnl:          [SKIP][244] ([Intel XE#2482]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [SKIP][246] ([Intel XE#1745] / [Intel XE#9144]) -> [PASS][247] +1 other test pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][248] ([Intel XE#7779]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][250] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][251] +13 other tests pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-lnl:          [SKIP][252] ([Intel XE#2568]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_invalid_mode@bad-vsync-end.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-lnl:          [SKIP][254] ([Intel XE#7780] / [Intel XE#9125]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plane@planar-pixel-format-settings.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [SKIP][256] ([Intel XE#9128]) -> [PASS][257] +1 other test pass
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plane@plane-position-covered.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-lnl:          [SKIP][258] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][259] +7 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-lnl:          [SKIP][260] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][261] +7 other tests pass
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-lnl:          [SKIP][262] ([Intel XE#6927] / [Intel XE#8854]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_pm_dc@dc5-pageflip-negative.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [SKIP][264] ([Intel XE#7106]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-lnl:          [SKIP][266] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][268] ([Intel XE#1489]) -> [PASS][269]
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-dpms:
    - shard-lnl:          [SKIP][270] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][271] +3 other tests pass
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr@psr-dpms.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_psr@psr-dpms.html

  * igt@xe_configfs@gt-types-allowed:
    - shard-bmg:          [ABORT][272] ([Intel XE#8007]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-4/igt@xe_configfs@gt-types-allowed.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_configfs@gt-types-allowed.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][274] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][275]
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          [SKIP][276] ([Intel XE#9125]) -> [SKIP][277] ([Intel XE#3279])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][278] ([Intel XE#9125]) -> [SKIP][279] ([Intel XE#1407]) +4 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [SKIP][280] ([Intel XE#9125]) -> [SKIP][281] ([Intel XE#7059] / [Intel XE#7085])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          [SKIP][282] ([Intel XE#1407]) -> [SKIP][283] ([Intel XE#9125]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][284] ([Intel XE#1477] / [Intel XE#7361]) -> [SKIP][285] ([Intel XE#9125])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-lnl:          [SKIP][286] ([Intel XE#9125]) -> [SKIP][287] ([Intel XE#1124]) +7 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          [SKIP][288] ([Intel XE#1124]) -> [SKIP][289] ([Intel XE#9125]) +10 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          [SKIP][290] ([Intel XE#9125]) -> [SKIP][291] ([Intel XE#1467] / [Intel XE#7367])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][292] ([Intel XE#9125]) -> [SKIP][293] ([Intel XE#7679])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-lnl:          [SKIP][294] ([Intel XE#7679]) -> [SKIP][295] ([Intel XE#9125]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][296] ([Intel XE#9125]) -> [SKIP][297] ([Intel XE#8365])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-lnl:          [SKIP][298] ([Intel XE#8365]) -> [SKIP][299] ([Intel XE#9125])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][300] ([Intel XE#9125]) -> [SKIP][301] ([Intel XE#367]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][302] ([Intel XE#367]) -> [SKIP][303] ([Intel XE#9125])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][304] ([Intel XE#9125]) -> [SKIP][305] ([Intel XE#2887]) +11 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][306] ([Intel XE#2887]) -> [SKIP][307] ([Intel XE#9125]) +15 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][308] ([Intel XE#2669] / [Intel XE#7389]) -> [SKIP][309] ([Intel XE#9125])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          [SKIP][310] ([Intel XE#9125]) -> [SKIP][311] ([Intel XE#3432])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][312] ([Intel XE#3432]) -> [SKIP][313] ([Intel XE#9125])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][314] ([Intel XE#9125]) -> [SKIP][315] ([Intel XE#2669] / [Intel XE#7389])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          [SKIP][316] ([Intel XE#4417] / [Intel XE#5447]) -> [SKIP][317] ([Intel XE#9125])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_cdclk@mode-transition.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_content_protection@suspend-resume:
    - shard-lnl:          [SKIP][318] ([Intel XE#7642]) -> [SKIP][319] ([Intel XE#9125]) +3 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_content_protection@suspend-resume.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          [SKIP][320] ([Intel XE#9125]) -> [SKIP][321] ([Intel XE#7642]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_content_protection@type1.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          [SKIP][322] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][323] ([Intel XE#9125])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          [SKIP][324] ([Intel XE#9125]) -> [SKIP][325] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          [SKIP][326] ([Intel XE#9125]) -> [SKIP][327] ([Intel XE#1424])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-lnl:          [SKIP][328] ([Intel XE#1424]) -> [SKIP][329] ([Intel XE#9125]) +5 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-lnl:          [SKIP][330] ([Intel XE#9125]) -> [SKIP][331] ([Intel XE#309] / [Intel XE#7343]) +3 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          [SKIP][332] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][333] ([Intel XE#9125]) +4 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [SKIP][334] ([Intel XE#323] / [Intel XE#6035]) -> [SKIP][335] ([Intel XE#9125])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][336] ([Intel XE#9125]) -> [SKIP][337] ([Intel XE#323] / [Intel XE#6035])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][338] ([Intel XE#4302]) -> [SKIP][339] ([Intel XE#9125])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][340] ([Intel XE#9125]) -> [SKIP][341] ([Intel XE#4354] / [Intel XE#7386])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          [SKIP][342] ([Intel XE#4354] / [Intel XE#5870]) -> [SKIP][343] ([Intel XE#9125])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_dp_link_training@uhbr-sst.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          [SKIP][344] ([Intel XE#8265]) -> [SKIP][345] ([Intel XE#9125]) +5 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_dsc@dsc-with-bpc.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          [SKIP][346] ([Intel XE#9125]) -> [SKIP][347] ([Intel XE#8265]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-lnl:          [SKIP][348] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][349] ([Intel XE#9125])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][350] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) -> [SKIP][351] ([Intel XE#1745] / [Intel XE#9144]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][352] ([Intel XE#7779]) -> [SKIP][353] ([Intel XE#6312]) +7 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][354] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][355] ([Intel XE#2548] / [Intel XE#7779]) +15 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render:
    - shard-lnl:          [SKIP][356] ([Intel XE#6312]) -> [SKIP][357] ([Intel XE#7779]) +16 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][358] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][359] ([Intel XE#2548] / [Intel XE#7779]) +39 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][360] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][361] ([Intel XE#656] / [Intel XE#7905]) +30 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][362] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][363] ([Intel XE#7779]) +4 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-lnl:          [SKIP][364] ([Intel XE#7779]) -> [SKIP][365] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-lnl:          [SKIP][366] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][367] ([Intel XE#6312] / [Intel XE#651]) +10 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][368] ([Intel XE#7061]) -> [SKIP][369] ([Intel XE#7779]) +2 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-lnl:          [SKIP][370] ([Intel XE#7399]) -> [SKIP][371] ([Intel XE#7779])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][372] ([Intel XE#7779]) -> [SKIP][373] ([Intel XE#7865]) +24 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:
    - shard-lnl:          [SKIP][374] ([Intel XE#7905]) -> [SKIP][375] ([Intel XE#7779]) +61 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:
    - shard-lnl:          [SKIP][376] ([Intel XE#7779]) -> [SKIP][377] ([Intel XE#7905]) +31 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          [SKIP][378] ([Intel XE#7865]) -> [SKIP][379] ([Intel XE#7779]) +29 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][380] ([Intel XE#7779]) -> [SKIP][381] ([Intel XE#7061]) +3 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][382] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][383] ([Intel XE#3544])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          [SKIP][384] ([Intel XE#1503]) -> [SKIP][385] ([Intel XE#9125])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_hdr@static-swap.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_hdr@static-swap.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-lnl:          [SKIP][386] ([Intel XE#599] / [Intel XE#7382]) -> [SKIP][387] ([Intel XE#9125])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_plane_lowres@tiling-4.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          [SKIP][388] ([Intel XE#599]) -> [SKIP][389] ([Intel XE#9125])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          [SKIP][390] ([Intel XE#4596] / [Intel XE#5854]) -> [SKIP][391] ([Intel XE#9125]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_plane_multiple@2x-tiling-none.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          [SKIP][392] ([Intel XE#3307]) -> [SKIP][393] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_plane_scaling@intel-max-src-size.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          [SKIP][394] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][395] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +5 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][396] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][397] ([Intel XE#1489]) +2 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          [SKIP][398] ([Intel XE#1489]) -> [SKIP][399] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +2 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][400] ([Intel XE#1489]) -> [SKIP][401] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          [SKIP][402] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][403] ([Intel XE#1489]) +3 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-lnl:          [SKIP][404] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][405] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-blt.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          [SKIP][406] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][407] ([Intel XE#1406] / [Intel XE#7345])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-render.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          [SKIP][408] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][409] ([Intel XE#1406]) +4 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr@pr-primary-blt.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          [SKIP][410] ([Intel XE#1406]) -> [SKIP][411] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_psr@pr-sprite-blt.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][412] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][413] ([Intel XE#9125]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][414] ([Intel XE#9125]) -> [SKIP][415] ([Intel XE#1127] / [Intel XE#5813])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][416] ([Intel XE#1127] / [Intel XE#5813]) -> [SKIP][417] ([Intel XE#9125])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-lnl:          [SKIP][418] ([Intel XE#9125]) -> [SKIP][419] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][420] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][421] ([Intel XE#2509] / [Intel XE#7437])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-lnl:          [SKIP][422] ([Intel XE#8397]) -> [SKIP][423] ([Intel XE#9125])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_vrr@lobf-dc3co.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_vrr@lobf-dc3co.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [DMESG-WARN][424] ([Intel XE#9130]) -> [ABORT][425] ([Intel XE#9131] / [Intel XE#9145])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-5/igt@xe_exec_reset@gt-reset-fault-injection.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_exec_reset@gt-reset-fault-injection.html
    - shard-lnl:          [ABORT][426] ([Intel XE#9140] / [Intel XE#9145]) -> [DMESG-WARN][427] ([Intel XE#9130])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_exec_reset@gt-reset-fault-injection.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [DMESG-WARN][428] ([Intel XE#8963]) -> [ABORT][429] ([Intel XE#8963])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_wedged@basic-wedged.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
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
  [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
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
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
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
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127
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

  * Linux: xe-5694-313da1cc22491f07075c7ae36372343aa235d11e -> xe-pw-149888v8

  IGT_9084: 9084
  xe-5694-313da1cc22491f07075c7ae36372343aa235d11e: 313da1cc22491f07075c7ae36372343aa235d11e
  xe-pw-149888v8: 149888v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/index.html

--===============3885997644030294493==
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
<tr><td><b>Series:</b></td><td>CPU binds and ULLS on migration queue (rev8)=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149888/">https://patchwork.freedesktop.org/series/149888/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149888v8/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149888v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5694-313da1cc22491f07075c7ae36372343aa=
235d11e_FULL -&gt; xe-pw-149888v8_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149888v8_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149888v8_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1498=
88v8_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_vm@bind-array-enobufs:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_vm@bind-array-enobufs.html=
">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149888v8_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@fbdev@in=
fo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149888v8/shard-lnl-6/igt@fbdev@info.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
25">Intel XE#1125</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7312">Intel XE#7312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-=
bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stri=
de-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1428">Intel XE#1428</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_bw@linear-tiling-2-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7008">Intel XE#7008</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_chamelium_audio@hdmi-audi=
o-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_chamelium_color_pipeline@=
plane-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_chamelium_color_pipeline@=
plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-wi=
th-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_colo=
r@ctm-0-75.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_color@ctm-0-75.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel=
 XE#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_color@legacy-gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/32=
97">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_colo=
r_pipeline@plane-lut1d-pre-ctm3x4.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_color_p=
ipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_content_protection@dp-mst=
-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_content_protection@uevent=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7642">Intel XE#7642</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding=
-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_dp_a=
ux_dev@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_dp_aux_dev@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">I=
ntel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_fbco=
n_fbt@fbc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127">Intel X=
E#9127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_fbco=
n_fbt@psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel X=
E#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/703">Intel XE#703</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1137">Intel XE#1137</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_feat=
ure_discovery@psr1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_feature_discovery@psr1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms-off-=
vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_flip@absolute-wf_vblank-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_flip=
@flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_flip@fli=
p-vs-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
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
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard=
-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_flip_tiling@flip-change-t=
iling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2682">Intel XE#2682</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
hdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +27 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +39 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +11 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +=
13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +42 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbch=
dr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7865">Intel XE#7865</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcp=
srhdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard=
-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7779">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@psr-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@k=
ms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-=
rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +14 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_hdmi_inject@inject-4k.htm=
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
e/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_hdr@static-toggle-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_inva=
lid_mode@bad-hsync-start.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_invalid_mode@bad=
-hsync-start.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2568">Intel XE#2568</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_invalid_mode@bad-vsync-st=
art.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_mst@mst-suspend-read-crc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_plan=
e@pixel-format-linear-modifier-source-clamping.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/ig=
t@kms_plane@pixel-format-linear-modifier-source-clamping.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE=
#7250</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_plane@pixel-format-x-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_plane@pixel-format-y-tile=
d-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_plan=
e@plane-position-hole.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane@plane-positio=
n-hole.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_plan=
e_scaling@plane-scaler-unity-scaling-with-modifiers.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl=
-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763=
">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6886">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane_scaling@plane-scale=
r-with-clipping-clamping-modifiers.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">In=
tel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/sha=
rd-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pip=
e-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_pm_b=
acklight@basic-brightness.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_backlight@ba=
sic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/870">Intel XE#870</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6@psr=
2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">=
Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_dc@dc5-psr-suspend-res=
ume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8854">Intel XE#8854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_pm_r=
pm@legacy-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4886">Intel XE#4886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_pm_r=
pm@modeset-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_pm_r=
pm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_pm_rpm@modes=
et-stress-extra-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-=
edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-=
edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel =
XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_psr2=
_sf@psr2-cursor-plane-move-continuous-sf.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_=
psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7413">Intel XE#7413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane=
-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_psr@fbc-psr2-no-drrs@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_psr@pr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234=
">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_psr@=
psr2-sprite-plane-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr@psr2-sprite-p=
lane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_setmode@invalid-clone-sin=
gle-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_vbla=
nk@query-forked.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_vblank@query-forked.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
125">Intel XE#9125</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@kms_vrr@lobf@pipe-a-edp-1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7638">Intel XE#7638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_vrr@negative-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/91=
25">Intel XE#9125</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_ccs@vm-bind-decompress.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_evict@evict-beng-cm-thread=
s-small-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_evict@evict-small-external=
-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@xe_exec_balancer@no-exec-cm-p=
arallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7482">Intel XE#7482</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_exec_multi_queue@many-queu=
es-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +37 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@xe_exec_reset@multi-queue-gt-=
reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-7/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-10/=
igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel=
 XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +12 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_gpgpu_fill@offset-4x4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-global:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_madvise@atomic-global.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7980">Intel XE#7980</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_mmap@pci-membarrier-parall=
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
.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14988=
8v8/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14988=
8v8/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149888v8/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14988=
8v8/shard-lnl-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14988=
8v8/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149888v8/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_multigpu_svm@mgpu-migratio=
n-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_page_reclaim@pat-index-xd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_page_reclaim@prl-invalidat=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_pat@d=
isplay-vs-wb-transient.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_pat@display-vs-wb-t=
ransient.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7590">Intel XE#7590</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_pat@pat-sw-hw-compare.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_pat@xa-app-transient-media=
-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_pm@s3-vm-bind-unbind-all.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7329">Intel XE#7329</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7456">Intel XE#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_prefetch_fault@l2-prefetch=
-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fa=
ult-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7599">Intel XE#7599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-9/igt@xe_pxp@regular-src-to-pxp-des=
t-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@default-sched-attributes-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@xe_sriov_admin@default-sched-=
attributes-vfs-disabled.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-1/igt@xe_sriov_auto_provisioning@se=
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
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-low-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_sriov_scheduling@equal-thr=
oughput-low-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149888v8/shard-lnl-2/igt@xe_wedged@wedged-at-any-timeo=
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
-149888v8/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_colo=
r@deep-color.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1511">Intel XE#1511</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_=
color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_colo=
r@legacy-gamma-reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_color@=
legacy-gamma-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_colo=
r_pipeline@plane-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_col=
or_pipeline@plane-ctm3x4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-position-change:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_curs=
or_crc@cursor-tearing-position-change.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl=
-7/igt@kms_cursor_crc@cursor-tearing-position-change.html">PASS</a> +39 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fb_c=
oherency@memset-crc.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_fb_coherency@memset-c=
rc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_flip=
@basic-flip-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_flip=
@basic-flip-vs-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/914=
4">Intel XE#9144</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-t=
o-64bpp-xtile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#=
7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149888v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrf=
b-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2=
548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
79">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-prims=
crn-pri-indfb-draw-render.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_inva=
lid_mode@bad-vsync-end.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_inva=
lid_mode@bad-vsync-end.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plan=
e@planar-pixel-format-settings.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7780">Intel XE#7780</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/sh=
ard-lnl-4/igt@kms_plane@planar-pixel-format-settings.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plan=
e@plane-position-covered.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_pl=
ane@plane-position-covered.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_plane_scaling@plane-downscale=
-factor-0-75-with-rotation@pipe-a.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687"=
>Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_plane_scaling@planes-u=
pscale-factor-0-25.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_pm_d=
c@dc5-pageflip-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6927">Intel XE#6927</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl=
-7/igt@kms_pm_dc@dc5-pageflip-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_pm_r=
pm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7106">Intel XE#7106</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_pm_r=
pm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">=
Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149888v8/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2=
_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#14=
89</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9888v8/shard-lnl-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed=
-fully-sf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr@=
psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_psr@ps=
r-dpms.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@gt-types-allowed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-4/igt@xe_confi=
gfs@gt-types-allowed.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-2/igt@xe_config=
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
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1498=
88v8/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>=
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_atom=
ic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shar=
d-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">In=
tel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8=
/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1407">Intel XE#1407</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_=
fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/sh=
ard-lnl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059=
">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_big_=
fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_=
big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1498=
88v8/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125=
">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@km=
s_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@km=
s_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_big_=
fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_big_fb@yf=
-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1467">Intel XE#1467</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1498=
88v8/shard-lnl-4/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1498=
88v8/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1498=
88v8/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1498=
88v8/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_bw@l=
inear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard=
-lnl-7/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel=
 XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_bw@l=
inear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-l=
nl-6/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@=
bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-ln=
l-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2=
887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_ccs@=
bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl=
-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#912=
5</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7=
389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49888v8/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-ln=
l-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3=
432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-ln=
l-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_ccs@=
random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/ig=
t@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#=
7389</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_cdcl=
k@mode-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5447">Intel XE#5447</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/ig=
t@kms_cdclk@mode-transition.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_cont=
ent_protection@suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@k=
ms_content_protection@suspend-resume.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_cont=
ent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_conten=
t_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_curs=
or_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/s=
hard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9=
125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_curs=
or_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/ig=
t@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7=
355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_curs=
or_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4=
/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_curs=
or_crc@cursor-sliding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms=
_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel =
XE#7343</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/s=
hard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE=
#9125</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel X=
E#323</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6035">Intel XE#6035</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-b=
efore-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel X=
E#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@k=
ms_display_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_dp_li=
nk_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_dp_l=
ink_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6=
/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_dsc@=
dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_dsc@dsc-with-b=
pc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/9125">Intel XE#9125</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_dsc@=
dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shar=
d-lnl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">In=
tel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Int=
el XE#7442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149888v8/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-v=
isible-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
745">Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7385">Intel XE#7385</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel X=
E#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#=
6312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
51">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-prims=
crn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +15 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@drrshdr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/=
shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7779">Intel XE#7779</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/790=
5">Intel XE#7905</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +39 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149888v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn=
-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +30 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbc-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#=
7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7779">Intel XE#7779</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/sh=
ard-lnl-7/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061=
">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7356">Intel XE#7356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7=
779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49888v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#706=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-=
mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7779">Intel XE#7779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/ig=
t@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Int=
el XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149888v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primsc=
rn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +24 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/i=
gt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +=
61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7=
779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49888v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7905">Intel XE#7905</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#786=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
888v8/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7779">Intel XE#7779</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/sh=
ard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061=
">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-6/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-10/=
igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_hdr@static-swap=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_plan=
e_lowres@tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@k=
ms_plane_lowres@tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane_lowr=
es@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-l=
nl-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_plan=
e_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@km=
s_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">In=
tel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Int=
el XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_plane_scaling@plane-downsc=
ale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#68=
86</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/768=
7">Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9125">Intel XE#9125</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel X=
E#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4608">Intel XE#4608</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7304">Intel XE#7304</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2=
-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7=
/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">In=
tel XE#4608</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr2=
_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-l=
nl-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE=
#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_psr2=
_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/sha=
rd-lnl-6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_psr@=
fbc-psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/=
igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr@=
fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/=
igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_psr@=
pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-7/igt@kms_=
psr@pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_psr@=
pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_psr@pr-sprite=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@kms_rota=
tion_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342"=
>Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect=
-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl=
-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#112=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813=
">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#58=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9888v8/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-6/igt@kms_rota=
tion_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl=
-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#341=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904=
">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
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
w-149888v8/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-5/igt@kms_vrr@=
lobf-dc3co.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8397">Intel XE#8397</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@kms_vrr@lobf-dc3co.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-bmg-5/igt@xe_exec_=
reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-bmg-=
2/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9131">Intel XE#9131</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel=
 XE#9145</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-1/igt@xe_exec_=
reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9140">Intel XE#9140</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/s=
hard-lnl-1/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel=
 XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5694-313da1cc22491f07075c7ae36372343aa235d11e/shard-lnl-3/igt@xe_wedge=
d@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v8/shard-lnl-6/igt@xe_wedged@=
basic-wedged.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5694-313da1cc22491f07075c7ae36372343aa235d11e -&gt; xe-pw-149=
888v8</li>
</ul>
<p>IGT_9084: 9084<br />
  xe-5694-313da1cc22491f07075c7ae36372343aa235d11e: 313da1cc22491f07075c7ae=
36372343aa235d11e<br />
  xe-pw-149888v8: 149888v8</p>

</body>
</html>

--===============3885997644030294493==--
