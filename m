Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D302C98304
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 04:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E614710E02D;
	Thu, 24 Sep 2026 04:01:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C519410E02D;
 Thu, 24 Sep 2026 04:01:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4628046751514273780=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/display=3A_Update?=
 =?utf-8?q?_the_CMN=5FSDP=5FTL_in_fastset_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Sep 2026 04:01:44 -0000
Message-ID: <179022250478.200921.731380392229155065@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260923133307.323439-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260923133307.323439-1-ankit.k.nautiyal@intel.com>
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

--===============4628046751514273780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Update the CMN_SDP_TL in fastset path
URL   : https://patchwork.freedesktop.org/series/174800/
State : failure

== Summary ==

CI Bug Log - changes from xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4_FULL -> xe-pw-174800v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174800v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174800v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174800v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:
    - shard-bmg:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-lnl:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-174800v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5901])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#7085])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5850])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5808]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +8 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7679])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#7679]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7679])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#5823] / [Intel XE#6918]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#5822]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#3432])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2652]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +8 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#9205]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#5824])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2325] / [Intel XE#7358])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#8391])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7358]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#7358])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#2252]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#373]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-3:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#6969]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-3.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-1:
    - shard-ptl:          NOTRUN -> [FAIL][37] ([Intel XE#9333]) +25 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-1.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-1:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#9333]) +12 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-1.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-2:
    - shard-lnl:          NOTRUN -> [FAIL][39] ([Intel XE#9333]) +9 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane-2.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#7642])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7642]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6974])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#5900]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#5846])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2321] / [Intel XE#7355])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2320])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1424]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][50] -> [INCOMPLETE][51] ([Intel XE#9210]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#309] / [Intel XE#7343])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#5962]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#6035]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#4302])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#4354] / [Intel XE#5882])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#7386])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#5870])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4331] / [Intel XE#7227])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#8265]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#8265]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5907]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4156] / [Intel XE#7425])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#702] / [Intel XE#7344])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2374] / [Intel XE#6128])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1421]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#2316]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#301] / [Intel XE#3149]) +2 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-ptl:          NOTRUN -> [SKIP][71] ([Intel XE#7179])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#7178]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7179])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#5800] / [Intel XE#6312]) +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2311]) +33 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#6312] / [Intel XE#651]) +6 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#6312]) +11 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4141]) +12 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#5865] / [Intel XE#7399])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#656] / [Intel XE#7905]) +14 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#5812]) +33 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1469] / [Intel XE#7399])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#7061]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#6312]) +6 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#7061]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-bmg:          [PASS][90] -> [INCOMPLETE][91] ([Intel XE#9259])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#7865]) +11 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#7905]) +20 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#7061]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#7865]) +12 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2313]) +48 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#9312])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1503])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#6901])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#6911] / [Intel XE#7378])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#4090] / [Intel XE#7443])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#7173] / [Intel XE#7294])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#8348])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2486])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][106] ([Intel XE#7283]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#7283]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#7283]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#5946]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#599])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-framedrop-check:
    - shard-ptl:          NOTRUN -> [SKIP][114] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_pm_dc@dc3co-framedrop-check.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][115] ([Intel XE#8396]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-bmg:          [PASS][116] -> [INCOMPLETE][117] ([Intel XE#9314])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#7794])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#3309] / [Intel XE#7368])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2499])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#7304])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#5858])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][124] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#4608])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#4608] / [Intel XE#7304])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#1489]) +6 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1406]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-ptl:          NOTRUN -> [SKIP][131] ([Intel XE#1406] / [Intel XE#5835]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-primary-blt:
    - shard-ptl:          NOTRUN -> [SKIP][132] ([Intel XE#1406])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2330] / [Intel XE#5813])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#5813]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#3904] / [Intel XE#7342])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-ptl:          NOTRUN -> [SKIP][137] ([Intel XE#5821])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2413])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#1435] / [Intel XE#8695])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#6503]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#330] / [Intel XE#5857])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#1499] / [Intel XE#9271])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [PASS][143] -> [FAIL][144] ([Intel XE#6293] / [Intel XE#7397])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-3/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [PASS][145] -> [FAIL][146] ([Intel XE#4227] / [Intel XE#7397]) +2 other tests fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2168] / [Intel XE#7444])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_vrr@lobf.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-bmg:          NOTRUN -> [ABORT][148] ([Intel XE#8868])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#8866])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-ptl:          NOTRUN -> [SKIP][150] ([Intel XE#7644])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][153] ([Intel XE#5764]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#8370]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#7482]) +9 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][156] ([Intel XE#7482]) +5 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2322] / [Intel XE#7372]) +6 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][158] ([Intel XE#5575] / [Intel XE#7484]) +6 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#1392]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#8374]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#8374]) +10 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][162] ([Intel XE#8374]) +5 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@few-execs-close-fd-smem:
    - shard-ptl:          NOTRUN -> [SKIP][163] ([Intel XE#8364]) +19 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@xe_exec_multi_queue@few-execs-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#8364]) +21 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@sanity:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#8364]) +13 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_exec_multi_queue@sanity.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-ptl:          NOTRUN -> [SKIP][166] ([Intel XE#8369])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#8369]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_reset@multi-queue-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#8369])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_exec_reset@multi-queue-close-fd.html

  * igt@xe_exec_system_allocator@evict-malloc:
    - shard-bmg:          [PASS][169] -> [DMESG-WARN][170] ([Intel XE#9309])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@xe_exec_system_allocator@evict-malloc.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-8/igt@xe_exec_system_allocator@evict-malloc.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
    - shard-ptl:          NOTRUN -> [SKIP][171] ([Intel XE#6196])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html

  * igt@xe_exec_system_allocator@prefetch-benchmark:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][172] ([Intel XE#9309] / [Intel XE#9331])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_exec_system_allocator@prefetch-benchmark.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
    - shard-bmg:          [PASS][173] -> [DMESG-WARN][174] ([Intel XE#9331]) +33 other tests dmesg-warn
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][175] ([Intel XE#9331]) +37 other tests dmesg-warn
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][176] -> [FAIL][177] ([Intel XE#9096] / [Intel XE#9297])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#8378]) +5 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#8378]) +5 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:
    - shard-ptl:          NOTRUN -> [SKIP][180] ([Intel XE#8378]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#6281] / [Intel XE#7426])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_madvise@atomic-global:
    - shard-ptl:          NOTRUN -> [SKIP][182] ([Intel XE#7980])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_madvise@atomic-global.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#9203])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_mempage_offline@inject-single-page.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#1416])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_mmap@vram.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209]) -> ([PASS][210], [SKIP][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235]) ([Intel XE#2457] / [Intel XE#7405])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-6/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-3/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-4/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-4/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-9/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-7/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-9/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-7/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-7/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-8/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-8/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-8/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-1/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-1/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-10/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-10/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-10/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-9/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-2/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-6/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-6/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-10/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-5/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-10/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-3/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-6/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-9/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-3/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-5/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-8/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-9/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-9/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-6/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][236] ([Intel XE#6964])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][237] ([Intel XE#6964]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][238] ([Intel XE#6964])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#7793]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#1420] / [Intel XE#7590])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][241] ([Intel XE#7695])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_peer2peer@read:
    - shard-ptl:          NOTRUN -> [SKIP][242] ([Intel XE#6588])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][243] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][244] ([Intel XE#2284] / [Intel XE#7370])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-ptl:          NOTRUN -> [SKIP][245] ([Intel XE#5741]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-i2c:
    - shard-ptl:          NOTRUN -> [SKIP][246] ([Intel XE#5742] / [Intel XE#7400])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][247] ([Intel XE#584] / [Intel XE#7369])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][248] -> [ABORT][249] ([Intel XE#9362]) +1 other test abort
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-5/igt@xe_pm@s4-basic-exec.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-ptl:          [PASS][250] -> [ABORT][251] ([Intel XE#9362]) +8 other tests abort
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-8/igt@xe_pm_residency@gt-c6-freeze.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-2/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][252] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][253] ([Intel XE#944]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-ptl:          NOTRUN -> [SKIP][254] ([Intel XE#6019])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][255] ([Intel XE#3342])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#4273])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-1/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [FAIL][257] ([Intel XE#6569])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_vfio@region-info:
    - shard-lnl:          NOTRUN -> [SKIP][258] ([Intel XE#7724])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_sriov_vfio@region-info.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-ptl:          NOTRUN -> [SKIP][259] ([Intel XE#7892])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][260] ([Intel XE#8963])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-ptl:          [ABORT][261] -> [PASS][262] +1 other test pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-5/igt@kms_async_flips@async-flip-suspend-resume.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-ptl:          [ABORT][263] ([Intel XE#9362] / [Intel XE#9378]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
    - shard-ptl:          [ABORT][265] ([Intel XE#9362]) -> [PASS][266] +2 other tests pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-ptl:          [DMESG-WARN][267] -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  * igt@kms_flip@dpms-vs-vblank-race@d-dp2:
    - shard-bmg:          [FAIL][269] ([Intel XE#3098]) -> [PASS][270] +2 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-2/igt@kms_flip@dpms-vs-vblank-race@d-dp2.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-10/igt@kms_flip@dpms-vs-vblank-race@d-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][271] ([Intel XE#301]) -> [PASS][272] +1 other test pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-ptl:          [FAIL][273] ([Intel XE#3098]) -> [PASS][274] +1 other test pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-3/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-bmg:          [INCOMPLETE][275] ([Intel XE#2594] / [Intel XE#9259]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [ABORT][277] ([Intel XE#9362]) -> [PASS][278] +1 other test pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [DMESG-WARN][279] -> [PASS][280] +1 other test pass
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - shard-bmg:          [DMESG-WARN][281] ([Intel XE#9331]) -> [PASS][282] +37 other tests pass
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-10/igt@xe_exec_system_allocator@process-many-new-nomemset.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-new-nomemset.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          [ABORT][283] ([Intel XE#8007]) -> [PASS][284] +1 other test pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-4/igt@xe_module_load@force-load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_module_load@force-load.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [INCOMPLETE][285] ([Intel XE#8175]) -> [PASS][286]
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-lnl:          [ABORT][287] ([Intel XE#9362]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][289] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][290] ([Intel XE#309] / [Intel XE#7343])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][291] ([Intel XE#301]) -> [FAIL][292] ([Intel XE#301] / [Intel XE#3149])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][293] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][294] ([Intel XE#3544])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][295] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][296] ([Intel XE#2426] / [Intel XE#5848])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][297] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][298] ([Intel XE#2509] / [Intel XE#7437])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5865
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6588
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205
  [Intel XE#9210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9210
  [Intel XE#9259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9259
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297
  [Intel XE#9309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9309
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9314
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331
  [Intel XE#9333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9333
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4 -> xe-pw-174800v1

  IGT_9110: 9110
  xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4: 890d1157247d8ad65d9a2d44c065accd550b61f4
  xe-pw-174800v1: 174800v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/index.html

--===============4628046751514273780==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Update the CMN_SDP_TL in f=
astset path</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/174800/">https://patchwork.freedesktop.org/series/174800/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-174800v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174800v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5812-890d1157247d8ad65d9a2d44c065accd5=
50b61f4_FULL -&gt; xe-pw-174800v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174800v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-174800v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1748=
00v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-8/igt@kms_asyn=
c_flips@async-flip-suspend-resume@pipe-c-dp-2.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/ig=
t@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html">ABORT</a> +1 =
other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspe=
nd.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-1/igt@kms_fron=
tbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-7/igt@kms_frontbuffer_=
tracking@fbc-suspend.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174800v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_big_fb@linear-max-hw-stri=
de-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_big_fb@x-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5850">Intel XE#5850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_bw@connected-linear-tilin=
g-2-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_bw@linear-tiling-3-displa=
ys-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_cdclk@mode-transition.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9205">Intel XE#9205</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_chamelium_color@ctm-0-75.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt2020.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_chamelium_color_pipeline@=
plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-with=
-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_color_pipeline@plane-ctm3=
x4-lut1d@pipe-a-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane=
-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_color_pipeline@plane-fixe=
d-matrix-yuv-rgb-bt601-lim@pipe-c-plane-1.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +25 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601@pipe-d-plane-1:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_color_pipeline@plane-fixe=
d-matrix-yuv-rgb-bt601@pipe-d-plane-1.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +12 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim@pipe-c-plane=
-2:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_color_pipeline@plane-fixe=
d-matrix-yuv-rgb-bt709-lim@pipe-c-plane-2.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9333">Intel XE#9333</a>) +9 o=
ther tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_content_protection@atomic=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_content_protection@dp-mst=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_content_protection@legacy=
-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>=
) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_cursor_crc@cursor-random-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5900">Intel XE#5900</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5846">Intel XE#5846</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-4/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-3/igt@kms_cursor_crc@cursor-s=
uspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9210">Intel XE#9210</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/702">Intel XE#702</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_flip@2x-nonexisting-fb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +2 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#73=
51</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bp=
p-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">In=
tel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-nv12=
-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +33 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_frontbuffer_tracking@drrs=
hdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5865">Intel XE#5865</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905=
</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +33 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbch=
dr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbchdr-suspend.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-6/igt@kms_frontbuff=
er_tracking@fbchdr-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9259">Intel XE#9259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-=
2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +20 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +48 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_hdmi_audio_bw@suspend-mem=
-audio-recovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_hdr@static-swap.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7173">Intel XE#7173</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7294">Intel XE#7294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_mst@mst-suspend-read-crc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_plane@pixel-format-y-tile=
d-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5946">Intel XE#5946</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_plane_scaling@planes-down=
scale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_pm_backlight@fade-with-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_pm_dc@dc3co-framedrop-che=
ck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_pm_dc@dc3co-framedrop-che=
ck@psr2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-3/igt@kms_pm_d=
c@dc5-dpms-suspend-resume.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-=
suspend-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9314">Intel XE#9314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">I=
ntel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_psr2_sf@fbc-pr-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304"=
>Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel=
 XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-=
edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-=
edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel =
XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@kms_psr@fbc-psr2-sprite-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_psr@pr-primary-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_psr@psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">I=
ntel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5813">Intel XE#5813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_rotation_crc@sprite-rotat=
ion-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@kms_sharpness_filter@invalid-=
plane-with-filter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_vrr@flip-basic-fastset.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1499">Intel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-8/igt@kms_vrr@=
flip-basic-fastset@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-3/igt@kms_vrr@flip-=
basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-3/igt@kms_vrr@=
flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_vrr@flip-suspen=
d@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +2 other tests fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@sriov_basic@pf-unbind-with-vf=
s-enabled-numvfs-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@sriov_basic@pf-unbind-with-vf=
s-enabled-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8866">Intel XE#8866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_ccs@vm-bind-fault-mode-dec=
ompress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@xe_evict@evict-beng-mixed-man=
y-threads-large.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_evict@evict-mixed-threads-=
small-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5764">Intel XE#5764</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_evict@evict-small-external=
-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_exec_balancer@many-paralle=
l-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_exec_balancer@no-exec-cm-p=
arallel-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#737=
2</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_exec_basic@multigpu-once-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi=
-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +10 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-close-fd-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@xe_exec_multi_queue@few-execs=
-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8364">Intel XE#8364</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +21 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@sanity:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_exec_multi_queue@sanity.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_exec_reset@cm-multi-queue-=
close-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_exec_reset@multi-queue-clo=
se-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_exec_reset@multi-queue-clo=
se-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@xe_exec_=
system_allocator@evict-malloc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-8/igt@xe_exec_system_=
allocator@evict-malloc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9309">Intel XE#9309</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-wt-single-vma.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@prefetch-benchmark:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_exec_system_allocator@pref=
etch-benchmark.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9309">Intel XE#9309</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-9/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-free-nomemset.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/=
shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free=
-nomemset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9331">Intel XE#9331</a>) +33 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_exec_system_allocator@twic=
e-mmap-remap-ro-dontunmap-eocheck.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) +37 ot=
her tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-8/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-7/i=
gt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel =
XE#9096</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9297">Intel XE#9297</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@xe_exec_threads@threads-multi=
-queue-cm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_exec_threads@threads-multi=
-queue-shared-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_fault_injection@exec-queue=
-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-global:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_madvise@atomic-global.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_mempage_offline@inject-sin=
gle-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_mmap@vram.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel =
XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/sha=
rd-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b=
61f4/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd=
550b61f4/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065=
accd550b61f4/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44=
c065accd550b61f4/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a=
2d44c065accd550b61f4/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad6=
5d9a2d44c065accd550b61f4/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d=
8ad65d9a2d44c065accd550b61f4/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d1157=
247d8ad65d9a2d44c065accd550b61f4/shard-bmg-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812-890d=
1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-10/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5812=
-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-10/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-10/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-9/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
74800v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-5/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-174800v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard=
-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174800v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-174800v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard=
-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174800v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174800v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-9/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-174800v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174800v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@xe_multigpu_svm@mgpu-atomic-o=
p-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-coherenc=
y-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@xe_multigpu_svm@mgpu-xgpu-acc=
ess-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_page_reclaim@binds-null-vm=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_pat@pat-sw-hw-suspend.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-7/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6588">I=
ntel XE#6588</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_pm@d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/57=
41">Intel XE#5741</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-6/igt@xe_pm@d3hot-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Int=
el XE#5742</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_pm@s3-multiple-execs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
84">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-5/igt@xe_pm@s4=
-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-174800v1/shard-lnl-4/igt@xe_pm@s4-basic-exec.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">In=
tel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-8/igt@xe_pm_re=
sidency@gt-c6-freeze.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-2/igt@xe_pm_residency@gt-c6-fr=
eeze.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9362">Intel XE#9362</a>) +8 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-1/igt@xe_sriov_flr@flr-twice.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
73">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@region-info:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_sriov_vfio@region-info.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7724">Intel XE#7724</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@xe_vm@overcommit-nonfault-vra=
m-lr-defer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174800v1/shard-lnl-5/igt@xe_wedged@basic-wedged.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-5/igt@kms_asyn=
c_flips@async-flip-suspend-resume.html">ABORT</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/igt@kms_async_=
flips@async-flip-suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378">Intel XE#9378=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1748=
00v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1748=
00v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp=
-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">DMESG-WARN</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-=
ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-2/igt@kms_flip=
@dpms-vs-vblank-race@d-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-10/igt@kms=
_flip@dpms-vs-vblank-race@d-dp2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-2/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-ptl-3/igt@kms_flip=
@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-ptl-4/ig=
t@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbchdr-stridechange.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9259">Intel XE=
#9259</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-174800v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-7/igt@kms_hdr@=
bpc-switch-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@kms_hdr@bpc=
-switch-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-7/igt@km=
s_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-10/igt@xe_exec=
_system_allocator@process-many-new-nomemset.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1748=
00v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-new-nomemset.htm=
l">PASS</a> +37 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-4/igt@xe_modul=
e_load@force-load.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-4/igt@xe_module_lo=
ad@force-load.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-6/igt@xe_pm@s3=
-multiple-execs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-2/igt@xe_pm@s3-=
multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-2/igt@xe_pxp@p=
xp-stale-bo-exec-post-suspend.html">ABORT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-3/ig=
t@xe_pxp@pxp-stale-bo-exec-post-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-8/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel X=
E#7343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7935">Intel XE#7935</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-174800v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-lnl-2/igt@kms_flip@=
flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shard-bmg-10/=
igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174800v1/shar=
d-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-174800v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4 -&gt; xe-pw-174=
800v1</li>
</ul>
<p>IGT_9110: 9110<br />
  xe-5812-890d1157247d8ad65d9a2d44c065accd550b61f4: 890d1157247d8ad65d9a2d4=
4c065accd550b61f4<br />
  xe-pw-174800v1: 174800v1</p>

</body>
</html>

--===============4628046751514273780==--
