Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A3AE77188
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 03:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A97D10E98A;
	Thu,  9 Jan 2025 03:14:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6AD10E984;
 Thu,  9 Jan 2025 03:14:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3651954675309060475=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc=3A_Adding_steer?=
 =?utf-8?q?ing_info_support_for_GuC_register_lists_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesus Narvaez" <jesus.narvaez@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 03:14:08 -0000
Message-ID: <173639244871.1491485.15103751665718030758@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212190100.3768068-1-jesus.narvaez@intel.com>
In-Reply-To: <20241212190100.3768068-1-jesus.narvaez@intel.com>
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

--===============3651954675309060475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Adding steering info support for GuC register lists (rev2)
URL   : https://patchwork.freedesktop.org/series/142503/
State : failure

== Summary ==

CI Bug Log - changes from xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6_full -> xe-pw-142503v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142503v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142503v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142503v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][2] -> [FAIL][3] +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html

  
New tests
---------

  New tests have been introduced between xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6_full and xe-pw-142503v2_full:

### New IGT tests (1) ###

  * igt@kms_rotation_crc:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-142503v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [PASS][4] -> [SKIP][5] ([Intel XE#1885])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1465])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_3d.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          NOTRUN -> [FAIL][7] ([Intel XE#3719]) +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          NOTRUN -> [FAIL][8] ([Intel XE#911]) +3 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#873])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#664])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#316])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3658])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1407]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#316])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#1033])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1428])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1124]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#367]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2191])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2314] / [Intel XE#2894])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#367])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1512])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +69 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +10 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#787]) +8 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2887]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#3432])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#1727] / [Intel XE#3124])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][41] -> [INCOMPLETE][42] ([Intel XE#3124])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#1727])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2724])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#314]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#306]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#306])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2252]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#373]) +6 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#373]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#373])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][53] ([Intel XE#2715])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#3278])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2321]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#308])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1424]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#309]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2286])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          NOTRUN -> [FAIL][60] ([Intel XE#1475])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#323])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2244])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#455]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@display:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#2423] / [i915#2575]) +40 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_feature_discovery@display.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_feature_discovery@display.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1138])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2374])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#310]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][69] -> [FAIL][70] ([Intel XE#2882] / [Intel XE#3288])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1421]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][72] -> [INCOMPLETE][73] ([Intel XE#2597])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][74] -> [FAIL][75] ([Intel XE#301]) +2 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][76] -> [FAIL][77] ([Intel XE#301]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - shard-bmg:          [PASS][78] -> [FAIL][79] ([Intel XE#3321])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1397] / [Intel XE#1745])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1397])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#455]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1401]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2293]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([i915#5274])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#651]) +9 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#651]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#656]) +26 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][91] ([Intel XE#2333])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#2136]) +11 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#651]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2311]) +6 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#653]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#653]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#656]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2313]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1470])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1470] / [Intel XE#2853])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1503])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_hdr@static-swap.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#356])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][104] -> [INCOMPLETE][105] ([Intel XE#1035]) +1 other test incomplete
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#3307])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][107] ([Intel XE#361])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#2763]) +7 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#736])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#3309])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][111] ([Intel XE#1430])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [PASS][112] -> [SKIP][113] ([Intel XE#2446]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1489])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1489])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2893]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1489])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2387])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1406]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2850] / [Intel XE#929])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1127])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#2413] / [Intel XE#374])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#374]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1435]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#362])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][129] ([Intel XE#899]) +3 other tests fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1499])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_eudebug@basic-client-th:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2905]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_eudebug@basic-client-th.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#2905]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#2905]) +6 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#688]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][136] -> [SKIP][137] ([Intel XE#1130]) +73 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2322]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1392]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1392]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#288]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#288]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-adlp:         [PASS][143] -> [DMESG-WARN][144] ([Intel XE#2953]) +2 other tests dmesg-warn
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-9/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_oa@blocking:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_oa@blocking.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@xe_oa@map-oa-buffer.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1061])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@xe_peer2peer@write.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][148] ([Intel XE#1173])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#2284] / [Intel XE#366])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#584]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][151] -> [ABORT][152] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#944]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#944])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#944])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#3342])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@core_getclient:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2423]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@core_getclient.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@core_getclient.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#3453]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#2134]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@fbdev@info.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@fbdev@info.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][163] ([Intel XE#827]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][165] ([Intel XE#1033]) -> [PASS][166] +2 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][168] +5 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][169] ([Intel XE#1033]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2-set2:     [INCOMPLETE][171] -> [PASS][172] +3 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_cdclk@mode-transition.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-434/igt@kms_cdclk@mode-transition.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [FAIL][173] ([Intel XE#3999]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:
    - shard-bmg:          [FAIL][175] -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][177] ([Intel XE#3321]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][179] ([Intel XE#301]) -> [PASS][180] +2 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][181] ([Intel XE#3288] / [Intel XE#3321]) -> [PASS][182] +2 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][183] ([Intel XE#2882] / [Intel XE#3288]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [FAIL][185] ([Intel XE#2882]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [FAIL][187] ([Intel XE#3321]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][189] ([Intel XE#886]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2136]) -> [PASS][192] +11 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#2423] / [i915#2575]) -> [PASS][194] +37 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_lease@lease-invalid-crtc.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2446]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@xe_exec_threads@threads-bal-fd-basic:
    - shard-lnl:          [INCOMPLETE][197] ([Intel XE#1169]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-lnl-8/igt@xe_exec_threads@threads-bal-fd-basic.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@xe_exec_threads@threads-bal-fd-basic.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [FAIL][199] ([Intel XE#3982]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1130]) -> [PASS][202] +75 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_pm@s2idle-exec-after.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [DMESG-WARN][203] ([Intel XE#2953]) -> [PASS][204] +3 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][205] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-9/igt@xe_pm@s4-basic.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][207] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [INCOMPLETE][209] ([Intel XE#3088]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][211] ([Intel XE#958]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][214] ([Intel XE#316]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1124]) -> [SKIP][216] ([Intel XE#2136]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][218] ([Intel XE#1124]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1124]) -> [SKIP][220] ([Intel XE#2136] / [Intel XE#2351])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#607]) -> [SKIP][222] ([Intel XE#2136])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2136]) -> [SKIP][224] ([Intel XE#610])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2136]) -> [SKIP][226] ([Intel XE#1124]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#2423] / [i915#2575]) -> [SKIP][228] ([Intel XE#2191])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#2191]) -> [SKIP][230] ([Intel XE#2423] / [i915#2575])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#367]) -> [SKIP][232] ([Intel XE#2423] / [i915#2575])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2136]) -> [SKIP][234] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][236] ([Intel XE#2136]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][238] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][240] ([Intel XE#2136] / [Intel XE#2351])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2907]) -> [SKIP][242] ([Intel XE#2136]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][244] ([Intel XE#314])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#373]) -> [SKIP][246] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2423] / [i915#2575]) -> [SKIP][248] ([Intel XE#373]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][249] ([Intel XE#1178]) -> [SKIP][250] ([Intel XE#2423] / [i915#2575])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2423] / [i915#2575]) -> [SKIP][252] ([Intel XE#308]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#308]) -> [SKIP][254] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#323]) -> [SKIP][256] ([Intel XE#2423] / [i915#2575])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#776]) -> [SKIP][258] ([Intel XE#2136])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_fbcon_fbt@psr.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1137]) -> [SKIP][260] ([Intel XE#2423] / [i915#2575])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2423] / [i915#2575]) -> [SKIP][262] ([Intel XE#1135])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][264] ([Intel XE#455]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#455]) -> [SKIP][266] ([Intel XE#2136] / [Intel XE#2351])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#455]) -> [SKIP][268] ([Intel XE#2136]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][270] ([Intel XE#651]) +6 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#651]) -> [SKIP][272] ([Intel XE#2136]) +8 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#651]) -> [SKIP][274] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#658]) -> [SKIP][276] ([Intel XE#2136] / [Intel XE#2351])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2136]) -> [SKIP][278] ([Intel XE#651]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2136]) -> [SKIP][280] ([Intel XE#455]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#653]) -> [SKIP][282] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][284] ([Intel XE#653]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2136]) -> [SKIP][286] ([Intel XE#653]) +10 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#653]) -> [SKIP][288] ([Intel XE#2136]) +11 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2927]) -> [SKIP][290] ([Intel XE#2136])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#455]) -> [SKIP][292] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2423] / [i915#2575]) -> [FAIL][294] ([Intel XE#361])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][296] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2938]) -> [SKIP][298] ([Intel XE#2136])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2136]) -> [SKIP][300] ([Intel XE#870])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2136]) -> [SKIP][302] ([Intel XE#3309])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1489]) -> [SKIP][304] ([Intel XE#2136]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136]) -> [SKIP][306] ([Intel XE#1489]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][308] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_psr@pr-primary-page-flip.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2136]) -> [SKIP][310] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2351]) -> [SKIP][312] ([Intel XE#2850] / [Intel XE#929])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][314] ([Intel XE#2136]) +3 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_psr@psr2-primary-render.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2939]) -> [SKIP][316] ([Intel XE#2136])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#3414]) -> [SKIP][318] ([Intel XE#2423] / [i915#2575])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2423] / [i915#2575]) -> [SKIP][320] ([Intel XE#1127])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#1127]) -> [SKIP][322] ([Intel XE#2423] / [i915#2575])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2423] / [i915#2575]) -> [SKIP][324] ([Intel XE#3414])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2423] / [i915#2575]) -> [SKIP][326] ([Intel XE#1500])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2423] / [i915#2575]) -> [SKIP][328] ([Intel XE#2168])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_vrr@cmrr.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2423] / [i915#2575]) -> [SKIP][330] ([Intel XE#455]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_vrr@flipline.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2423] / [i915#2575]) -> [SKIP][332] ([Intel XE#756])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [FAIL][333] ([Intel XE#3664] / [Intel XE#3981]) -> [INCOMPLETE][334] ([Intel XE#3918])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1130]) -> [SKIP][336] ([Intel XE#2905]) +5 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_eudebug@basic-close.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#3889]) -> [SKIP][338] ([Intel XE#1130])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][339] ([Intel XE#1473] / [Intel XE#402]) -> [SKIP][340] ([Intel XE#1130])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [FAIL][341] ([Intel XE#1000]) -> [TIMEOUT][342] ([Intel XE#1473])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [TIMEOUT][343] ([Intel XE#1473]) -> [FAIL][344] ([Intel XE#1000])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_fault_mode@many-rebind-imm:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#288]) -> [SKIP][346] ([Intel XE#1130]) +11 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@xe_exec_fault_mode@many-rebind-imm.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_exec_fault_mode@many-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1130]) -> [SKIP][348] ([Intel XE#288]) +11 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2360]) -> [SKIP][350] ([Intel XE#1130])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2905]) -> [SKIP][352] ([Intel XE#1130]) +4 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][354] ([Intel XE#1130]) +2 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@xe_oa@mi-rpc.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@non-sampling-read-error:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1130]) -> [SKIP][356] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_oa@non-sampling-read-error.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_oa@non-sampling-read-error.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1130]) -> [SKIP][358] ([Intel XE#979])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][359] ([Intel XE#1173]) -> [SKIP][360] ([Intel XE#1061])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@xe_peer2peer@read.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#1061]) -> [FAIL][362] ([Intel XE#1173])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_peer2peer@write.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][364] ([Intel XE#1130])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1130]) -> [SKIP][366] ([Intel XE#579])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1130]) -> [SKIP][368] ([Intel XE#944]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#944]) -> [SKIP][370] ([Intel XE#1130]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#3664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3664
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3918
  [Intel XE#3981]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3981
  [Intel XE#3982]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3982
  [Intel XE#3999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3999
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6 -> xe-pw-142503v2

  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6: bde58d6ae1762f088585e76d78b5f0efb87154e6
  xe-pw-142503v2: 142503v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/index.html

--===============3651954675309060475==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Adding steering info support for GuC register lists (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142503/">https://patchwork.freedesktop.org/series/142503/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6_full -&gt; xe-pw-142503v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142503v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-142503v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-142503v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6_full and xe-pw-142503v2_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_rotation_crc:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142503v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_async_flips@test-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_feature_discovery@display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_feature_discovery@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client-th:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_eudebug@basic-client-th.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@xe_eudebug@discovery-empty-clients.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-9/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_oa@blocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-2/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@core_getclient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@core_getclient.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_cdclk@mode-transition.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-434/igt@kms_cdclk@mode-transition.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3999">Intel XE#3999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_lease@lease-invalid-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_lease@lease-invalid-crtc.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-lnl-8/igt@xe_exec_threads@threads-bal-fd-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-3/igt@xe_exec_threads@threads-bal-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3982">Intel XE#3982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_gt_freq@freq_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_pm@s2idle-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_pm@s2idle-exec-after.html">PASS</a> +75 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-adlp-3/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-5/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3664">Intel XE#3664</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3981">Intel XE#3981</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-3/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3918">Intel XE#3918</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@xe_exec_fault_mode@many-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_exec_fault_mode@many-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_oa@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_oa@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-434/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142503v2/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6 -&gt; xe-pw-142503v2</li>
</ul>
<p>IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2448-bde58d6ae1762f088585e76d78b5f0efb87154e6: bde58d6ae1762f088585e76d78b5f0efb87154e6<br />
  xe-pw-142503v2: 142503v2</p>

</body>
</html>

--===============3651954675309060475==--
