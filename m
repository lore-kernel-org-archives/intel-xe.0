Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D52CE77184
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 00:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A3010E63C;
	Wed, 18 Dec 2024 00:48:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775E510E63C;
 Wed, 18 Dec 2024 00:47:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0101101544790152968=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_support_for_EU_stall_s?=
 =?utf-8?q?ampling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Dec 2024 00:47:59 -0000
Message-ID: <173448287947.4059793.9160460450550990666@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1734427624.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1734427624.git.harish.chegondi@intel.com>
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

--===============0101101544790152968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for EU stall sampling
URL   : https://patchwork.freedesktop.org/series/142707/
State : failure

== Summary ==

CI Bug Log - changes from xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8_full -> xe-pw-142707v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142707v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142707v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142707v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@deep-color@pipe-b-hdmi-a-6-ctm:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-434/igt@kms_color@deep-color@pipe-b-hdmi-a-6-ctm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-434/igt@kms_color@deep-color@pipe-b-hdmi-a-6-ctm.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][7] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [PASS][8] -> [DMESG-FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-6/igt@xe_pm@s3-mocs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@xe_pm@s3-mocs.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          NOTRUN -> [FAIL][10] +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@xe_pm_residency@cpg-basic.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][11] ([Intel XE#2998]) -> [INCOMPLETE][12] +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-463/igt@xe_live_ktest@xe_bo.html

  
Known issues
------------

  Here are the changes found in xe-pw-142707v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2233])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1466])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#324]) +3 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@crc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][17] ([Intel XE#3781]) +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][18] ([Intel XE#3781])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#607])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2327]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#316]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#316]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1124]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#610])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2191])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#2191])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2314] / [Intel XE#2894])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2191])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#367])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#367]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#367])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2907])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2887]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#2907])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#787]) +20 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#3442])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#3432])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2887]) +9 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#787]) +41 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][44] -> [INCOMPLETE][45] ([Intel XE#1727]) +1 other test incomplete
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#314])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2325])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#306])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#373]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2252]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#373]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#373])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#1178]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2341])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_content_protection@content-type-change.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#3278])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2390])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#307])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#307])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][60] ([Intel XE#1178]) +3 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#455]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#308])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2321])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2321])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2320])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1424])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#309]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#309])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
    - shard-bmg:          [PASS][69] -> [DMESG-WARN][70] ([Intel XE#877])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2291]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2286])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#323])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2244])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#776])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1138])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1135])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1421])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#310]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#3321]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][82] ([Intel XE#301]) +2 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][83] ([Intel XE#3664])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][84] -> [INCOMPLETE][85] ([Intel XE#2597])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][86] -> [FAIL][87] ([Intel XE#2882]) +1 other test fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#301])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2293]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][92] -> [FAIL][93] ([Intel XE#1874])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#651]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2311]) +18 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#656]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#651]) +8 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][98] ([Intel XE#2333]) +9 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [FAIL][99] ([Intel XE#1861])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#651]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1151])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#653]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2313]) +17 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#656]) +15 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#653]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#3544])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2934])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#3012])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2927])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][110] -> [DMESG-WARN][111] ([Intel XE#3086]) +4 other tests dmesg-warn
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2763]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2938])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#870])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          NOTRUN -> [FAIL][115] ([Intel XE#1430])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#734])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1489]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1489]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#1489]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1406])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_psr@pr-suspend.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-adlp:         NOTRUN -> [FAIL][124] ([Intel XE#1874])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#3414]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1435])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#330])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][128] ([Intel XE#3864])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@max-min:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#455]) +10 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1499]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#756])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-433/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#756])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#1447])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1126])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2905]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@connect-user:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#2905])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@xe_eudebug@connect-user.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2905]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#2905]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [FAIL][139] ([Intel XE#2364]) +1 other test fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][140] ([Intel XE#1473])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#688]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@xe_evict@evict-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#688]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1392]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#1392]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2322]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#288]) +8 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#288]) +11 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [PASS][149] -> [DMESG-WARN][150] ([Intel XE#3086] / [Intel XE#3343])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][151] ([Intel XE#3086])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [PASS][152] -> [SKIP][153] ([Intel XE#1192]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         NOTRUN -> [FAIL][154] ([Intel XE#1999]) +2 other tests fail
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@oa-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@xe_oa@oa-formats.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#1420])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#1420] / [Intel XE#2838])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][159] -> [DMESG-WARN][160] ([Intel XE#2953] / [Intel XE#3086])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@xe_pm@s4-basic.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-6/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][161] -> [ABORT][162] ([Intel XE#1794])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-1/igt@xe_pm@s4-mocs.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][163] -> [ABORT][164] ([Intel XE#1794])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#579])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#944])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#944]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-adlp:         [PASS][168] -> [ABORT][169] ([Intel XE#3084])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-9/igt@xe_wedged@wedged-mode-toggle.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][170] ([Intel XE#1426]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][172] ([Intel XE#1727]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][174] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-adlp:         [TIMEOUT][176] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][177] +2 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [DMESG-WARN][178] -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-464/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - shard-adlp:         [INCOMPLETE][180] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][182] ([Intel XE#301]) -> [PASS][183] +2 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][184] ([Intel XE#3321]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-dg2-set2:     [INCOMPLETE][186] ([Intel XE#2049]) -> [PASS][187] +2 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-464/igt@kms_flip@absolute-wf_vblank.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-433/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][188] ([Intel XE#2882]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][190] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][192] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-dg2-set2:     [FAIL][194] ([Intel XE#2882]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][196] -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1:
    - shard-lnl:          [FAIL][198] ([Intel XE#886]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [FAIL][200] ([Intel XE#886]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@kms_flip@plain-flip-ts-check.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-8/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][202] ([Intel XE#1874]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [DMESG-WARN][204] ([Intel XE#2566] / [Intel XE#877]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-7/igt@kms_plane@pixel-format-source-clamping.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-5:
    - shard-bmg:          [DMESG-WARN][206] ([Intel XE#877]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-5.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-5.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [DMESG-FAIL][208] -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-8/igt@kms_pm_rpm@system-suspend-modeset.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][210] ([Intel XE#1435]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][212] ([Intel XE#899]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][214] ([Intel XE#1473]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][216] ([Intel XE#1192]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-3/igt@xe_live_ktest@xe_migrate.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-8/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][218] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [INCOMPLETE][220] -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@xe_pm@s4-mocs.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@xe_pm@s4-mocs.html
    - shard-lnl:          [ABORT][222] ([Intel XE#1794]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@xe_pm@s4-mocs.html

  * igt@xe_vm@munmap-style-unbind-end:
    - shard-bmg:          [DMESG-WARN][224] -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-5/igt@xe_vm@munmap-style-unbind-end.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@xe_vm@munmap-style-unbind-end.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-WARN][226] ([Intel XE#3086]) -> [PASS][227] +3 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][228] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#3818]) -> [DMESG-FAIL][229] ([Intel XE#1033] / [Intel XE#1727])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][230] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324]) -> [DMESG-WARN][231] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][232] ([Intel XE#324]) -> [FAIL][233] ([Intel XE#1231])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][234] ([Intel XE#1178]) -> [SKIP][235] ([Intel XE#2341])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_content_protection@atomic.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][236] ([Intel XE#2882]) -> [SKIP][237] ([Intel XE#2316])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [SKIP][238] ([Intel XE#2316]) -> [INCOMPLETE][239] ([Intel XE#2597])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][240] ([Intel XE#2311]) -> [SKIP][241] ([Intel XE#2312]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [TIMEOUT][242] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][243] ([Intel XE#1861])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][244] ([Intel XE#2333]) -> [SKIP][245] ([Intel XE#2312])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][246] ([Intel XE#2050]) -> [FAIL][247] ([Intel XE#2333])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [TIMEOUT][248] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][249] ([Intel XE#651])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][250] ([Intel XE#2312]) -> [SKIP][251] ([Intel XE#2313]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-adlp:         [TIMEOUT][252] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][253] ([Intel XE#653])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][254] ([Intel XE#2313]) -> [SKIP][255] ([Intel XE#2312]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#1500]) -> [SKIP][257] ([Intel XE#362])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][258] ([Intel XE#1473]) -> [INCOMPLETE][259] ([Intel XE#1473])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [INCOMPLETE][260] ([Intel XE#1473]) -> [TIMEOUT][261] ([Intel XE#1473]) +1 other test timeout
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-large.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][262] ([Intel XE#2833]) -> [SKIP][263] ([Intel XE#1192])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [DMESG-WARN][282], [PASS][283], [SKIP][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289]) ([Intel XE#3086] / [Intel XE#378]) -> ([PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [SKIP][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315]) ([Intel XE#378])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-2/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-1/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-4/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-2/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-4/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-4/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-2/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-4/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-1/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-1/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-4/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-9/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-9/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-2/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-6/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-1/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-1/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-1/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-1/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-1/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-6/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-6/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-6/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-8/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-9/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-9/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-8/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-8/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-8/igt@xe_module_load@load.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3664
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#3818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818
  [Intel XE#3864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8 -> xe-pw-142707v1

  IGT_8160: 4f10d98c56498ab29445ae0b06aab6f5a8ec2eca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8: ff2d4c1b285a836d28341cdf04adbc811757d4c8
  xe-pw-142707v1: 142707v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/index.html

--===============0101101544790152968==
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
<tr><td><b>Series:</b></td><td>Add support for EU stall sampling</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142707/">https://patchwork.freedesktop.org/series/142707/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142707v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142707v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2390-ff2d4c1b285a836d28341cdf04adbc811=
757d4c8_full -&gt; xe-pw-142707v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142707v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142707v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1427=
07v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@deep-color@pipe-b-hdmi-a-6-ctm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-434/igt@kms_co=
lor@deep-color@pipe-b-hdmi-a-6-ctm.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-434/igt@kms_colo=
r@deep-color@pipe-b-hdmi-a-6-ctm.html">INCOMPLETE</a> +1 other test incompl=
ete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-7/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_cursor_crc@cursor-s=
uspend.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/sha=
rd-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pip=
e-a.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_vblank@ts-continuation-dp=
ms-suspend@pipe-a-hdmi-a-3.html">INCOMPLETE</a> +1 other test incomplete</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-6/igt@xe_pm@s3=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142707v1/shard-bmg-6/igt@xe_pm@s3-mocs.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@xe_pm_residency@cpg-basic.htm=
l">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-434/igt@xe_liv=
e_ktest@xe_bo.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-463/igt@xe_live_ktes=
t@xe_bo.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142707v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@km=
s_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324<=
/a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_async_flips@crc.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3781">Intel XE#3781</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@kms_async_flips@crc@pipe-a-hd=
mi-a-3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3781">Intel XE#3781</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_big_fb@4-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_big_fb@x-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_bw@connected-linear-tilin=
g-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_bw@linear-tiling-3-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg=
2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_chamelium_color@ctm-max.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_chamelium_color@ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mod=
e-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-fr=
ame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_chamelium_hpd@hdmi-hpd-wi=
th-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_content_protection@atom=
ic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_content_protection@dp-ms=
t-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offsc=
reen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-m=
ovement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-m=
ovement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs=
-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-7/igt@kms_cursor_=
legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_feature_discovery@psr2.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-blocking-=
wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-i=
nterruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3664">Intel XE#3664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-8/igt@kms_flip@2=
x-flip-vs-suspend@ab-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-7/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_flip@2x-wf_vblank-=
ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@b-dp4.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-464/=
igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE=
#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other t=
ests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +9 other tests fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr=
-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_joiner@invalid-modeset-f=
orce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-9/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +=
4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@kms_pm_backlight@fade-with-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_pm_dc@dc6-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">=
Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">=
Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plan=
e-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_psr@fbc-psr2-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_psr@pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@kms_psr@pr-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">=
Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_rotation_crc@multiplane-=
rotation-cropping-top.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@kms_setmode@invalid-clone-sin=
gle-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_vblank@ts-continuation-dp=
ms-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3864">Intel XE#3864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@kms_vrr@max-min.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-433/igt@kms_writeback@writeback-che=
ck-output.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_writeback@writeback-inva=
lid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ex=
tended-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@xe_eudebug@connect-user.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@xe_eudebug_online@interrupt-o=
ther.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_eudebug_online@writes-cac=
hing-vram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@xe_evict@evict-beng-large-mul=
ti-vm-cm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2364">Intel XE#2364</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@xe_evict@evict-beng-threads-l=
arge.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_evict@evict-mixed-many-th=
reads-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@xe_evict@evict-threads-small.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_evict_ccs@evict-overcommi=
t-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exe=
c-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)=
 +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-us=
erptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-4/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/sha=
rd-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_i=
nit.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3086">Intel XE#3086</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_fault_injection@inject-fa=
ult-probe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-2/igt@xe_live_=
ktest@xe_dma_buf.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_live_ktest@xe_mocs@xe_liv=
e_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@xe_oa@oa-formats.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">=
Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_oa@syncs-syncobj-cfg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@xe_pm@s=
4-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142707v1/shard-adlp-6/igt@xe_pm@s4-basic.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel=
 XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-1/igt@xe_pm@s=
4-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142707v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#179=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-lnl-3/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-a=
ll.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@xe_query@multigpu-query-engin=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142707v1/shard-dg2-435/igt@xe_query@multigpu-query-inv=
alid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-9/igt@xe_wedg=
ed@wedged-mode-toggle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@xe_wedged@wedged-mode-=
toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/=
shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shar=
d-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
13">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-463/igt@kms_ccs@random-ccs-da=
ta-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@kms_cur=
sor_crc@cursor-onscreen-256x85.html">TIMEOUT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1=
/shard-adlp-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> +2 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">DMESG-WARN</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v=
1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor=
-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@kms_cur=
sor_legacy@cursora-vs-flipa-toggle.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42707v1/shard-adlp-3/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard=
-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard=
-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-464/igt@kms_fl=
ip@absolute-wf_vblank.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-433/igt@k=
ms_flip@absolute-wf_vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg=
-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg=
2-436/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1427=
07v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-463/igt@kms_fl=
ip@plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-d=
g2-434/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-463/igt@kms_fl=
ip@plain-flip-fb-recreate-interruptible@a-hdmi-a6.html">FAIL</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-4=
34/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-lnl-1/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shar=
d-lnl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@kms_fli=
p@plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-8/igt@kms_flip@p=
lain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1427=
07v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-=
to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-7/igt@kms_plan=
e@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707=
v1/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-7/igt@kms_plan=
e@pixel-format-source-clamping@pipe-b-plane-5.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707=
v1/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-5.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-8/igt@kms_pm_r=
pm@system-suspend-modeset.html">DMESG-FAIL</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/igt@kms_pm_rpm@sy=
stem-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bm=
g-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-lnl-1/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-lnl=
-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-464/igt@xe_evi=
ct@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-dg2-=
436/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-3/igt@xe_live_=
ktest@xe_migrate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-8/igt@xe_live_ktest@=
xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-9/igt@xe_pm@s=
4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/=
igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@xe_pm@s4=
-mocs.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142707v1/shard-bmg-3/igt@xe_pm@s4-mocs.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-lnl-2/igt@xe_pm@s4=
-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142707v1/shard-lnl-6/igt@xe_pm@s4-mocs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-end:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-5/igt@xe_vm@mu=
nmap-style-unbind-end.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-5/igt@xe_vm@munmap-styl=
e-unbind-end.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-4/igt@xe_wedg=
ed@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-1/i=
gt@xe_wedged@wedged-at-any-timeout.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-9/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3818">Intel XE#3818</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@kms_async_flips@alte=
rnate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-9/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/324">Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@kms_async_flips@altern=
ate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#=
1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
24">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">=
Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142707v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-ro=
tate-180-hflip-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-=
bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel =
XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-2/i=
gt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142707v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel =
XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1427=
07v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Int=
el XE#2050</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142707v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr=
-indfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">I=
ntel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
707v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbcpsr-rgb101010-draw-render.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"=
>Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142707v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb1010=
10-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142707v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-5/igt@xe_evict=
@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-b=
mg-7/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel=
 XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-2/igt@xe_evict=
@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg=
-1/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-bmg-1/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-bmg-6/igt@xe_live_ktest@=
xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c=
8/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc8117=
57d4c8/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adb=
c811757d4c8/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf=
04adbc811757d4c8/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d283=
41cdf04adbc811757d4c8/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a83=
6d28341cdf04adbc811757d4c8/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b2=
85a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d=
4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390=
-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8/shard-ad=
lp-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4=
c8/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04adbc811=
757d4c8/shard-adlp-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341cdf04ad=
bc811757d4c8/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d28341=
cdf04adbc811757d4c8/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285a836d=
28341cdf04adbc811757d4c8/shard-adlp-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c1b285=
a836d28341cdf04adbc811757d4c8/shard-adlp-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2390-ff2d4c=
1b285a836d28341cdf04adbc811757d4c8/shard-adlp-2/igt@xe_module_load@load.htm=
l">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3086">Intel XE#3086</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142707v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142707v1/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/sh=
ard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142707v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142707v1/shard-adlp-1/igt@xe_module_load@load.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707=
v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142707v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adl=
p-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42707v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142707v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shar=
d-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142707v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142707v1/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707=
v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adlp-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142707v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142707v1/shard-adl=
p-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8 -&gt; xe-pw-142=
707v1</li>
</ul>
<p>IGT_8160: 4f10d98c56498ab29445ae0b06aab6f5a8ec2eca @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2390-ff2d4c1b285a836d28341cdf04adbc811757d4c8: ff2d4c1b285a836d28341cd=
f04adbc811757d4c8<br />
  xe-pw-142707v1: 142707v1</p>

</body>
</html>

--===============0101101544790152968==--
